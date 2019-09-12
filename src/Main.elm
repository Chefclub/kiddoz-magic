module Main exposing (main)

import Browser
import Data.Kiddoz exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import View.Recipe exposing (showRecipe)
import Yaml.Decode


type alias Flags =
    ()


type alias Model =
    { recipe : Recipe
    }


type Msg
    = NoOp


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { recipe =
            { title = "Tarte aux citrons"
            , number_of_people = 6
            , preparation_minutes = 30
            , sections =
                [ { title = "Pâte"
                  , ingredients =
                        [ Ingredient "Farine" Flour 250 Grams
                        , Ingredient "Sucre" Sugar 100 Grams
                        , Ingredient "Beurre" Butter 150 Grams
                        , Ingredient "Œuf" Piece 1 Unit
                        , Ingredient "Poudre d'amande" GroundAlmonds 100 Grams
                        ]
                  , steps =
                        [ "Préchauffer le four à 180 °C (th. 6). "
                        , "Dans un bol, mélanger le beurre avec le sucre glace"
                        , "Ajouter l'oeuf puis la farine et la poudre d'amande (ne pas trop travailler la pâte)"
                        , "Faire une boule avec la pâte, la mettre dans un film alimentaire et la laisser reposer au moins 15 minutes au frais."
                        , "A l'aide d'un rouleau à pâtisserie, étaler la pâte, et la répartir ensuite dans un moule à tarte."
                        ]
                  }
                , { title = "Appareil"
                  , ingredients =
                        [ Ingredient "Citrons" Piece 2 Unit
                        , Ingredient "Sucre" Sugar 150 Grams
                        , Ingredient "Œufs" Piece 3 Unit
                        , Ingredient "Beurre" Butter 120 Grams
                        ]
                  , steps =
                        [ "Dans une casserole, presser le jus des citrons et le mélanger avec le beurre."
                        , "Les faire fondre à feu doux."
                        , "Dans un bol, blanchir les oeufs avec le sucre en fouettant vigoureusement"
                        , "Verser le beurre fondu et le jus de citron dessus."
                        , "Verser l'appareil sur la pâte cuite et enfourner 20 à 30 minutes."
                        ]
                  }
                ]
            }
      }
    , Cmd.none
    )


view model =
    div [ id "content" ]
        [ img [ src "assets/images/Logo-KIDDOZ-01.svg", alt "Kiddoz logo", class "logo" ] []
        , h2 [] [ text "Convertisseur de recettes" ]
        , Html.form []
            [ table []
                [ thead []
                    [ tr []
                        [ th [] [ text "Ingrédient" ]
                        , th [] [ text "Quantité" ]
                        , th [] [ text "Unité" ]
                        , th [] [ text "Kiddoz" ]
                        ]
                    ]
                , tbody []
                    [ tr []
                        [ td [] [ input [ type_ "text", placeholder "Ingrédient" ] [] ]
                        , td [] [ input [ type_ "text", placeholder "Quantité" ] [] ]
                        , td [] [ input [ type_ "text", placeholder "Unité" ] [] ]
                        , td [] []
                        ]
                    ]
                ]
            , div [] [ button [] [ text "Valider la recette " ] ]
            ]
        , showRecipe model.recipe
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


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
