module View exposing (view)

import Array
import Change exposing (coinsList, giveChange)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Kiddoz exposing (..)
import Types exposing (..)


view model =
    div [ id "content" ]
        [ img [ src "assets/images/Logo-KIDDOZ-01.svg", alt "Kiddoz logo", class "logo" ] []
        , h2 [] [ text "Convertisseur de recettes" ]
        , Html.form [ onSubmit ConvertIngredients ]
            [ table []
                [ thead []
                    [ tr []
                        [ th [] [ text "Ingrédient" ]
                        , th [] [ text "Quantité" ]
                        , th [] [ text "Unité" ]
                        ]
                    ]
                , model.editingIngredients
                    |> Array.indexedMap showIngredientList
                    |> Array.toList
                    |> tbody []
                , div [] [ button [ type_ "button", onClick AddIngredient ] [ text "+" ] ]
                , div [] [ button [ type_ "button", onClick <| RemoveIngredient -1 ] [ text "-" ] ]
                ]
            , div [] [ button [ type_ "submit" ] [ text "Convertir" ] ]
            , div [] [ button [ type_ "button", onClick Reinit ] [ text "Recommencer" ] ]
            ]
        , showRecipe model
        ]


showIngredientList : Int -> Ingredient -> Html Msg
showIngredientList index ingredient =
    let
        currentKind =
            ingredient.kind
                |> Maybe.map kindToString
                |> Maybe.withDefault "--"

        currentUnit =
            ingredient.unit |> unitToString

        buildOption current candidate =
            option [ value candidate, selected (candidate == current) ] [ text candidate ]
    in
    tr []
        [ td []
            [ [ [ buildOption currentKind "--" ]
              , existingIngredients
                    |> List.map kindToString
                    |> List.sort
                    |> List.map (buildOption currentKind)
              ]
                |> List.concat
                |> select [ onInput <| SetKind index ]
            ]
        , td []
            [ input
                [ type_ "number"
                , Html.Attributes.min "0"
                , Html.Attributes.step "1"
                , placeholder "Quantité"
                , onInput <| SetQuantity index
                , ingredient.quantity |> String.fromInt |> value
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
                |> select [ onInput <| SetUnit index ]
            ]
        , td []
            [ button
                [ type_ "button"
                , class "remove"
                , onClick <| RemoveIngredient index
                ]
                [ text "X" ]
            ]
        ]


showRecipe : Model -> Html Msg
showRecipe model =
    div [ id "recipe_content" ]
        [ aside []
            [ model.ingredients
                |> List.map (showKiddoz model.static)
                |> ul []
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


showKiddoz : String -> Ingredient -> Html Msg
showKiddoz imagePrefix ingredient =
    showKiddozQuantity imagePrefix ingredient
        |> li
            [ showIngredientQuantity ingredient
                ++ " de "
                ++ ingredient.name
                |> title
            ]


showKiddozQuantity : String -> Ingredient -> List (Html Msg)
showKiddozQuantity imagePrefix ingredient =
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
                , [ text " de "
                  , text ingredient.name
                  ]
                ]

        Nothing ->
            [ strong []
                [ ingredient.quantity
                    |> String.fromInt
                    |> text
                ]
            , text " de "
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
