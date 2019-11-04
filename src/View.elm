module View exposing (view)

import Array
import Change exposing (coinsList, giveChange)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput, onSubmit)
import Kiddoz
    exposing
        ( Kind(..)
        , Unit(..)
        , existingIngredients
        , existingUnits
        , food2mL
        , kindToString
        , unitToSelectString
        , unitTomL
        )
import L10n
import Types exposing (..)


view : Model -> Html Msg
view model =
    let
        t =
            L10n.t model.locale
    in
    div [ id "kiddoz-magik", class "container" ]
        [ h2 [ class "center uppercase" ] [ text <| t "Convertisseur de recettes" ]
        , div [ class "row" ]
            [ Html.form [ onSubmit ConvertIngredients, class "col-sm-12 col-md-12 col-lg-6 offset-lg-1" ]
                [ div [ class "card" ]
                    [ h2 [] [ text <| t "Ta recette" ]
                    , div [ class "card-content container" ]
                        [ div [ class "row" ]
                            [ model.editingIngredients
                                |> Array.indexedMap (showIngredientList t)
                                |> Array.toList
                                |> div [ class "col-12" ]
                            , div [ class "col-12 ingredientList ingredientListActions" ]
                                [ button [ type_ "button", class "remove", onClick <| RemoveIngredient -1 ] [ text "-" ]
                                , button [ type_ "button", class "add", onClick AddIngredient ] [ text "+" ]
                                ]
                            ]
                        ]
                    ]
                , div [ class "row" ]
                    [ div [ class "col-12 col-sm-6" ]
                        [ div [] [ button [ type_ "button", class "btn transparent", onClick Reinit ] [ text <| t "Recommencer" ] ]
                        ]
                    , div [ class "col-12 col-sm-6" ]
                        [ div [] [ button [ type_ "submit", class "btn" ] [ text <| t "Convertir" ] ]
                        ]
                    ]
                ]
            , div [ class "col-sm-12 col-md-12 col-lg-4" ]
                [ div [ class "card" ] [ h2 [ class "orange" ] [ text <| t "Ta recette Kiddoz" ], showRecipe t model ]
                ]
            ]
        ]


showIngredientList : (String -> String) -> Int -> Ingredient -> Html Msg
showIngredientList t index ingredient =
    let
        currentKind =
            ingredient.kind
                |> Maybe.map kindToString
                |> Maybe.map t
                |> Maybe.withDefault "--"

        currentUnit =
            ingredient.unit |> unitToSelectString |> t

        buildOption current candidate =
            option [ value candidate, selected (candidate == current) ] [ text <| t candidate ]
    in
    div [ class "ingredientList" ]
        [ div [ class "ingredientList-button" ]
            [ button
                [ type_ "button"
                , class "remove"
                , onClick <| RemoveIngredient index
                ]
                [ text "X" ]
            ]
        , div [ class "ingredientList-form row  no-gutters" ]
            [ div [ class "col-12 col-sm-12 col-md-6" ]
                [ [ [ buildOption currentKind "--" ]
                  , existingIngredients
                        |> List.map kindToString
                        |> List.sort
                        |> List.map (buildOption currentKind)
                  ]
                    |> List.concat
                    |> select [ onInput <| SetKind index ]
                ]
            , div [ class "col-6 col-sm-6 col-md-3" ]
                [ input
                    [ type_ "number"
                    , Html.Attributes.min "0"
                    , Html.Attributes.step "1"
                    , placeholder <| t "Quantité"
                    , onInput <| SetQuantity index
                    , ingredient.quantity |> String.fromInt |> value
                    ]
                    []
                ]
            , div [ class "col-6 col-sm-6 col-md-3" ]
                [ [ [ buildOption currentUnit "--"
                    ]
                  , existingUnits
                        |> List.map unitToSelectString
                        |> List.map (buildOption currentUnit)
                  ]
                    |> List.concat
                    |> select [ onInput <| SetUnit index ]
                ]
            ]
        ]


showRecipe : (String -> String) -> Model -> Html Msg
showRecipe t model =
    div [ id "recipe_content" ]
        [ aside []
            [ model.ingredients
                |> List.map (showKiddoz t model.static)
                |> ul []
            ]
        ]


showIngredientQuantity : (String -> String) -> Ingredient -> String
showIngredientQuantity t ingredient =
    (ingredient.quantity
        |> String.fromInt
    )
        ++ " "
        ++ (ingredient.unit
                |> unitToString t
           )



-- showIngredient : (String -> String) -> Ingredient -> Html Msg
-- showIngredient t ingredient =
--     li []
--         [ strong []
--             [ showIngredientQuantity t ingredient |> text
--             ]
--         , text " "
--         , text ingredient.name
--         ]


showKiddoz : (String -> String) -> String -> Ingredient -> Html Msg
showKiddoz t imagePrefix ingredient =
    showKiddozQuantity t imagePrefix ingredient
        |> li
            [ showIngredientQuantity t ingredient
                ++ t " de "
                ++ ingredient.name
                |> title
            ]


showKiddozQuantity : (String -> String) -> String -> Ingredient -> List (Html Msg)
showKiddozQuantity t imagePrefix ingredient =
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
                [ mL2cup imagePrefix mL
                    |> List.intersperse (text " + ")
                , [ text <| t " de "
                  , text ingredient.name
                  ]
                ]

        Nothing ->
            [ strong []
                [ ingredient.quantity
                    |> String.fromInt
                    |> text
                ]
            , text <| t " de "
            , text ingredient.name
            ]


mL2cup : String -> Float -> List (Html Msg)
mL2cup imagePrefix mL =
    let
        change =
            giveChange (mL |> round) coinsList
    in
    change
        |> List.map
            (\value ->
                case value of
                    250 ->
                        img [ src <| imagePrefix ++ "images/0001-chef.png" ] []

                    245 ->
                        img [ src <| imagePrefix ++ "images/0001-chef.png" ] []

                    240 ->
                        img [ src <| imagePrefix ++ "images/0001-chef.png" ] []

                    125 ->
                        img [ src <| imagePrefix ++ "images/0002-cochon.png" ] []

                    120 ->
                        img [ src <| imagePrefix ++ "images/0002-cochon.png" ] []

                    85 ->
                        img [ src <| imagePrefix ++ "images/0003-chat.png" ] []

                    80 ->
                        img [ src <| imagePrefix ++ "images/0003-chat.png" ] []

                    65 ->
                        img [ src <| imagePrefix ++ "images/0004-souris.png" ] []

                    60 ->
                        img [ src <| imagePrefix ++ "images/0004-souris.png" ] []

                    15 ->
                        img [ src <| imagePrefix ++ "images/0005-poule.png" ] []

                    5 ->
                        img [ src <| imagePrefix ++ "images/0006-poussin.png" ] []

                    _ ->
                        text <| String.fromInt value
            )


unitToString : (String -> String) -> Unit -> String
unitToString t unit =
    case unit of
        Grams ->
            t "g"

        Centiliters ->
            t "cL"

        Milliliters ->
            t "mL"

        Cup ->
            t "cup"

        HalfCup ->
            t "1/2 cup"

        ThirdCup ->
            t "1/3 cup"

        QuarterCup ->
            t "1/4 cup"

        Tablespoon ->
            t "tbsp"

        Teaspoon ->
            t "tsp"

        Oz ->
            t "oz"

        Unit ->
            t ""
