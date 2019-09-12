module Main exposing (main)

import Browser
import Data.Kiddoz exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Request.Lists exposing (decodeLists, getLists)
import Yaml.Decode


type alias Flags =
    ()


type alias Model =
    { ingredients : List Ingredient
    , lists : Lists
    }


type Msg
    = FetchedLists (Result Http.Error String)


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { ingredients = [], lists = emptyLists }, getLists FetchedLists )


view model =
    div [ id "content" ]
        [ img [ src "assets/images/Logo-KIDDOZ-01.svg", alt "Kiddoz logo", class "logo" ] []
        , h2 [] [ text "Convertisseur de recettes" ]
        , Html.form [] []
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchedLists (Ok response) ->
            case Yaml.Decode.fromString decodeLists response of
                Ok lists ->
                    ( { model | lists = lists }, Cmd.none )

                Err error ->
                    let
                        _ =
                            error
                                |> Debug.log "Yaml Lists Decode Error"
                    in
                    ( model, Cmd.none )

        FetchedLists (Err error) ->
            let
                _ =
                    error
                        |> Debug.log "Lists fetching failed"
            in
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
