module View.Recipe exposing (showKiddozQuantity, showRecipe)

import Change exposing (coinsList, giveChange)
import Data.Kiddoz exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


showRecipe : Recipe -> Html msg
showRecipe recipe =
    List.concat
        [ [ div [ id "recipe_info" ]
                [ div [ class "recipe_details" ]
                    [ h3 [ class "poule" ] [ text "Quantité" ]
                    , p []
                        [ strong []
                            [ text <|
                                String.fromInt recipe.number_of_people
                            ]
                        , text " personnes"
                        ]
                    , h3 [ class "horloge" ] [ text "Préparation" ]
                    , p []
                        [ strong []
                            [ text <|
                                String.fromInt recipe.preparation_minutes
                            ]
                        , text " minutes"
                        ]
                    ]
                , div [ id "recipe_title" ]
                    [ h2 [] [ text recipe.title ]
                    ]
                ]
          ]
        , List.map showSection recipe.sections
        ]
        |> div [ id "recipe_content" ]


showSection : Section -> Html msg
showSection section =
    div [ class "recipe_section" ]
        [ aside []
            [ section.ingredients
                |> List.map showIngredient
                |> ul []
            , section.ingredients
                |> List.map showKiddoz
                |> ul []
            ]
        , Html.section []
            [ h3 [] [ text section.title ]
            , section.steps
                |> List.map showStep
                |> ol []
            ]
        ]


showIngredient : Ingredient -> Html msg
showIngredient ingredient =
    li []
        [ strong []
            [ ingredient.quantity
                |> String.fromInt
                |> text
            , text " "
            , ingredient.unit
                |> unitToString
                |> text
            ]
        , text " "
        , text ingredient.name
        ]


showKiddoz : Ingredient -> Html msg
showKiddoz ingredient =
    showKiddozQuantity ingredient
        |> li []


showStep : Step -> Html msg
showStep step =
    li [] [ text step ]


showKiddozQuantity : Ingredient -> List (Html msg)
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


mL2cup : Float -> List (Html msg)
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

                    125 ->
                        img [ src "assets/images/0002-cochon.png" ] []

                    85 ->
                        img [ src "assets/images/0003-chat.png" ] []

                    65 ->
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
