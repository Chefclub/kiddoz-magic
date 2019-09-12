module View.Recipe exposing (showRecipe)

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
                |> round
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
    li []
        [ showKiddozQuantity ingredient
        ]


showStep : Step -> Html msg
showStep step =
    li [] [ text step ]


showKiddozQuantity : Ingredient -> Html msg
showKiddozQuantity ingredient =
    let
        maybeMLFactor =
            case ingredient.unit of
                Grams ->
                    food2mL ingredient.kind

                _ ->
                    unitTomL ingredient.unit

        maybeML =
            Maybe.map (\mLFactor -> ingredient.quantity * mLFactor) maybeMLFactor
    in
    case maybeML of
        Just mL ->
            List.concat
                [ mL2cup mL
                , [ text " ", text ingredient.name ]
                ]
                |> li []

        Nothing ->
            li []
                [ strong []
                    [ ingredient.quantity
                        |> round
                        |> String.fromInt
                        |> text
                    ]
                , text " "
                , text ingredient.name
                ]


mL2cup : Float -> List (Html msg)
mL2cup mL =
    [ img [ src "assets/images/chef.png" ] [] ]


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
