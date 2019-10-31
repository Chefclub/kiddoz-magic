module Main exposing (main)

import Array
import Browser
import Browser.Dom as Dom
import Change exposing (coinsList, giveChange)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Kiddoz exposing (..)
import Task
import Types exposing (..)
import View exposing (view)
import Yaml.Decode


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        locale =
            flags.locale
                |> localeFromString
    in
    ( { emptyModel
        | locale = locale
        , static = flags.static
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ editingIngredients, ingredients } as model) =
    case msg of
        SetKind index name ->
            let
                ingredient =
                    Array.get index editingIngredients
                        |> Maybe.withDefault emptyIngredient

                newIngredient =
                    { ingredient
                        | name = name
                        , kind = kindFromName name
                    }

                newIngredients =
                    editingIngredients
                        |> Array.set index newIngredient
            in
            ( { model | editingIngredients = newIngredients }, Cmd.none )

        SetUnit index unit ->
            let
                ingredient =
                    Array.get index editingIngredients
                        |> Maybe.withDefault emptyIngredient

                newIngredient =
                    { ingredient
                        | unit = unitFromName unit
                    }

                newIngredients =
                    editingIngredients
                        |> Array.set index newIngredient
            in
            ( { model | editingIngredients = newIngredients }, Cmd.none )

        SetQuantity index quantity ->
            let
                ingredient =
                    Array.get index editingIngredients
                        |> Maybe.withDefault emptyIngredient

                newIngredient =
                    { ingredient
                        | quantity =
                            String.toInt quantity
                                |> Maybe.withDefault 0
                    }

                newIngredients =
                    editingIngredients
                        |> Array.set index newIngredient
            in
            ( { model | editingIngredients = newIngredients }, Cmd.none )

        AddIngredient ->
            let
                newIngredients =
                    editingIngredients
                        |> Array.push emptyIngredient
            in
            ( { model
                | editingIngredients = newIngredients
              }
            , Cmd.none
            )

        RemoveIngredient index ->
            if index < 0 then
                ( { model | editingIngredients = Array.slice 0 -1 editingIngredients }, Cmd.none )

            else
                let
                    newIngredients =
                        editingIngredients
                            |> Array.toIndexedList
                            |> List.filter (\( i, x ) -> i /= index)
                            |> List.map Tuple.second
                            |> Array.fromList
                in
                ( { model | editingIngredients = newIngredients }, Cmd.none )

        ConvertIngredients ->
            ( { model | ingredients = Array.toList editingIngredients }, Cmd.none )

        Reinit ->
            ( emptyModel, Cmd.none )


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
