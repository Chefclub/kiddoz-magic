module Main exposing (main)

import Browser
import Browser.Dom as Dom
import Change exposing (coinsList, giveChange)
import Data.Kiddoz exposing (..)
import Data.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Task
import View.Recipe exposing (showKiddozQuantity, showRecipe)
import Yaml.Decode


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { selectedIngredient =
            { emptyIngredient
                | kind = Just Flour
                , unit = Grams
            }
      , recipe =
            { title = "Tarte aux citrons"
            , ingredients =
                [ Ingredient "Citrons" Nothing 2 Unit
                , Ingredient "Sucre" (Just Sugar) 150 Grams
                , Ingredient "Œufs" Nothing 3 Unit
                , Ingredient "Beurre" (Just Butter) 120 Grams
                ]
            , steps =
                [ "Dans une casserole, presser le jus des citrons et le mélanger avec le beurre."
                , "Les faire fondre à feu doux."
                , "Dans un bol, blanchir les oeufs avec le sucre en fouettant vigoureusement"
                , "Verser le beurre fondu et le jus de citron dessus."
                , "Verser l'appareil sur la pâte cuite et enfourner 20 à 30 minutes."
                ]
            }
      , editing = NoEdition
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ selectedIngredient, recipe } as model) =
    case msg of
        SetEditing editing ->
            let
                idForEdit =
                    case editing of
                        Title ->
                            "title"

                        StepAdd _ ->
                            "new_step"

                        StepEdit _ _ ->
                            "edit_step"

                        NoEdition ->
                            ""
            in
            ( { model | editing = editing }
            , Task.attempt (\_ -> NoOp) (Dom.focus idForEdit)
            )

        SetKind name ->
            let
                nameCandidate =
                    selectedIngredient.kind
                        |> Maybe.map kindToString
                        |> Maybe.withDefault ""

                newName =
                    if selectedIngredient.name == "" || selectedIngredient.name == nameCandidate then
                        name

                    else
                        selectedIngredient.name

                ingredient =
                    { selectedIngredient | name = newName, kind = kindFromName name }
            in
            ( { model | selectedIngredient = ingredient }, Cmd.none )

        SetName name ->
            let
                ingredient =
                    { selectedIngredient | name = name }
            in
            ( { model | selectedIngredient = ingredient }, Cmd.none )

        SetUnit unit ->
            let
                ingredient =
                    { selectedIngredient | unit = unitFromName unit }
            in
            ( { model | selectedIngredient = ingredient }, Cmd.none )

        SetQuantity quantity ->
            let
                ingredient =
                    { selectedIngredient
                        | quantity =
                            String.toInt quantity
                                |> Maybe.withDefault 0
                    }
            in
            ( { model | selectedIngredient = ingredient }, Cmd.none )

        AddIngredient ->
            let
                newIngredients =
                    model.recipe.ingredients
                        |> List.reverse
                        |> List.filter (\x -> x.name /= selectedIngredient.name)
                        |> (::) selectedIngredient
                        |> List.reverse
            in
            ( { model
                | recipe = { recipe | ingredients = newIngredients }
                , selectedIngredient = emptyIngredient
              }
            , Cmd.none
            )

        Remove ingredientName ->
            let
                newIngredients =
                    model.recipe.ingredients
                        |> List.filter (\x -> x.name /= ingredientName)
            in
            ( { model | recipe = { recipe | ingredients = newIngredients } }, Cmd.none )

        SetTitle title ->
            ( { model
                | recipe = { recipe | title = title }
              }
            , Cmd.none
            )

        AddNewStep current_step ->
            ( { model
                | recipe =
                    { recipe
                        | steps =
                            recipe.steps
                                |> List.reverse
                                |> (::) current_step
                                |> List.reverse
                    }
                , editing = NoEdition
              }
            , Cmd.none
            )

        EditStep previous_step next_step ->
            ( { model
                | recipe =
                    { recipe
                        | steps =
                            recipe.steps
                                |> List.map
                                    (\x ->
                                        if x == previous_step then
                                            next_step

                                        else
                                            x
                                    )
                                |> List.filter (\x -> x /= "")
                    }
                , editing = NoEdition
              }
            , Cmd.none
            )

        NoOp ->
            ( model, Cmd.none )


view model =
    let
        currentKind =
            model.selectedIngredient.kind
                |> Maybe.map kindToString
                |> Maybe.withDefault "--"

        currentUnit =
            model.selectedIngredient.unit |> unitToString

        buildOption current ingredient =
            option [ value ingredient, selected (ingredient == current) ] [ text ingredient ]
    in
    div [ id "content" ]
        [ img [ src "assets/images/Logo-KIDDOZ-01.svg", alt "Kiddoz logo", class "logo" ] []
        , h2 [] [ text "Convertisseur de recettes" ]
        , Html.form [ onSubmit AddIngredient ]
            [ table []
                [ thead []
                    [ tr []
                        [ th [] [ text "Ingrédient" ]
                        , th [] [ text "Name" ]
                        , th [] [ text "Quantité" ]
                        , th [] [ text "Unité" ]
                        ]
                    ]
                , tbody []
                    [ tr []
                        [ td []
                            [ [ [ buildOption currentKind "--" ]
                              , existingIngredients
                                    |> List.map kindToString
                                    |> List.sort
                                    |> List.map (buildOption currentKind)
                              ]
                                |> List.concat
                                |> select [ onInput SetKind ]
                            ]
                        , td []
                            [ input
                                [ placeholder "Name"
                                , onInput SetName
                                , value model.selectedIngredient.name
                                ]
                                []
                            ]
                        , td []
                            [ input
                                [ type_ "number"
                                , Html.Attributes.min "0"
                                , Html.Attributes.step "1"
                                , placeholder "Quantité"
                                , onInput SetQuantity
                                , model.selectedIngredient.quantity |> String.fromInt |> value
                                ]
                                []
                            ]
                        , td []
                            [ [ [ buildOption currentUnit "--"
                                ]
                              , existingUnits
                                    |> List.map unitToString
                                    |> List.map (buildOption currentUnit)
                              ]
                                |> List.concat
                                |> select [ onInput SetUnit ]
                            ]
                        ]
                    ]
                ]
            , showKiddozQuantity model.selectedIngredient |> div []
            , div [] [ button [] [ text "Ajouter à la recette" ] ]
            ]
        , List.map showIngredientList model.recipe.ingredients |> ul []
        , showRecipe model
        ]


showIngredientList : Ingredient -> Html Msg
showIngredientList ingredient =
    li []
        [ text ingredient.name
        , text " "
        , button [ class "remove", onClick <| Remove ingredient.name ] [ text "X" ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
