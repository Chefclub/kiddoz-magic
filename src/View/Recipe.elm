module View.Recipe exposing (showKiddozQuantity, showRecipe)

import Change exposing (coinsList, giveChange)
import Data.Kiddoz exposing (..)
import Data.Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


showRecipe : Model -> Html Msg
showRecipe ({ recipe } as model) =
    div [ id "recipe_content" ]
        [ div [ id "recipe_info" ]
            [ div [ id "recipe_title" ]
                [ if model.editing /= Title then
                    h2 [ onClick <| SetEditing Title ] [ text recipe.title ]

                  else
                    Html.form [ onSubmit <| SetEditing NoEdition ]
                        [ input
                            [ onBlur <| SetEditing NoEdition
                            , style "width" "100%"
                            , onInput <| SetTitle
                            , value recipe.title
                            , id "title"
                            ]
                            []
                        ]
                ]
            ]
        , div [ class "recipe_section" ]
            [ aside []
                [ recipe.ingredients
                    |> List.map showIngredient
                    |> ul []
                , recipe.ingredients
                    |> List.map showKiddoz
                    |> ul []
                ]
            , Html.section []
                [ recipe.steps
                    |> List.map (showStep model)
                    |> ol []
                , case model.editing of
                    StepAdd current_step ->
                        Html.form [ onSubmit <| AddNewStep current_step ]
                            [ input
                                [ id "new_step"
                                , style "width" "100%"
                                , value current_step
                                , onInput <| SetEditing << StepAdd
                                , onBlur <| AddNewStep current_step
                                ]
                                []
                            ]

                    _ ->
                        button [ onClick <| SetEditing <| StepAdd "" ] [ text "+" ]
                ]
            ]
        ]


showIngredientQuantity : Ingredient -> String
showIngredientQuantity ingredient =
    (ingredient.quantity
        |> String.fromInt
    )
        ++ " "
        ++ (ingredient.unit
                |> unitToString
           )


showIngredient : Ingredient -> Html Msg
showIngredient ingredient =
    li []
        [ strong []
            [ showIngredientQuantity ingredient |> text
            ]
        , text " "
        , text ingredient.name
        ]


showKiddoz : Ingredient -> Html Msg
showKiddoz ingredient =
    showKiddozQuantity ingredient
        |> li
            [ showIngredientQuantity ingredient
                ++ " "
                ++ ingredient.name
                |> title
            ]


showStep : Model -> Step -> Html Msg
showStep model step =
    let
        display =
            li [ onClick <| SetEditing <| StepEdit step step ] [ text step ]
    in
    case model.editing of
        StepEdit previous_value current_value ->
            if previous_value == step then
                li []
                    [ Html.form [ onSubmit <| EditStep previous_value current_value ]
                        [ input
                            [ style "width" "100%"
                            , id "edit_step"
                            , onBlur <| EditStep previous_value current_value
                            , onInput <| SetEditing << StepEdit previous_value
                            , value current_value
                            ]
                            []
                        ]
                    ]

            else
                display

        _ ->
            display


showKiddozQuantity : Ingredient -> List (Html Msg)
showKiddozQuantity ingredient =
    let
        maybeMLFactor =
            case ( ingredient.unit, ingredient.kind ) of
                ( Grams, Just kind ) ->
                    food2mL kind

                _ ->
                    unitTomL ingredient.unit

        maybeML =
            Maybe.map (\mLFactor -> toFloat ingredient.quantity * mLFactor) maybeMLFactor
    in
    case maybeML of
        Just mL ->
            List.concat
                [ mL2cup mL
                ]

        Nothing ->
            [ strong []
                [ ingredient.quantity
                    |> String.fromInt
                    |> text
                ]
            , text " "
            , text ingredient.name
            ]


mL2cup : Float -> List (Html Msg)
mL2cup mL =
    let
        change =
            giveChange (mL |> round) coinsList
    in
    change
        |> List.map
            (\value ->
                case value of
                    250 ->
                        img [ src "assets/images/0001-chef.png" ] []

                    245 ->
                        img [ src "assets/images/0001-chef.png" ] []

                    240 ->
                        img [ src "assets/images/0001-chef.png" ] []

                    125 ->
                        img [ src "assets/images/0002-cochon.png" ] []

                    120 ->
                        img [ src "assets/images/0002-cochon.png" ] []

                    85 ->
                        img [ src "assets/images/0003-chat.png" ] []

                    80 ->
                        img [ src "assets/images/0003-chat.png" ] []

                    65 ->
                        img [ src "assets/images/0004-souris.png" ] []

                    60 ->
                        img [ src "assets/images/0004-souris.png" ] []

                    15 ->
                        img [ src "assets/images/0005-poule.png" ] []

                    5 ->
                        img [ src "assets/images/0006-poussin.png" ] []

                    _ ->
                        text <| String.fromInt value
            )


unitToString : Unit -> String
unitToString unit =
    case unit of
        Grams ->
            "g"

        Centiliters ->
            "cL"

        Milliliters ->
            "mL"

        Cup ->
            "cup"

        HalfCup ->
            "1/2 cup"

        ThirdCup ->
            "1/3 cup"

        QuarterCup ->
            "1/4 cup"

        Tablespoon ->
            "tbsp"

        Teaspoon ->
            "tsp"

        Oz ->
            "oz"

        Unit ->
            ""
