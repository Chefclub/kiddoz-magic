module Main exposing (main)

import Array
import Browser
import Kiddoz
    exposing
        ( Kind(..)
        , kindFromName
        , kindToString
        , unitFromName
        )
import L10n
import Types
    exposing
        ( Flags
        , Model
        , Msg(..)
        , emptyIngredient
        , emptyModel
        , localeFromString
        )
import View exposing (view)


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        locale =
            flags.locale
                |> localeFromString

        t =
            L10n.t locale
    in
    ( { emptyModel
        | locale = locale
        , static = flags.static
        , editingIngredients = Array.fromList [ emptyIngredient <| t <| kindToString Flour ]
      }
    , Cmd.none
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ editingIngredients } as model) =
    case msg of
        SetKind index name ->
            let
                t =
                    L10n.t model.locale

                ingredient =
                    Array.get index editingIngredients
                        |> Maybe.withDefault (emptyIngredient "")

                newIngredient =
                    { ingredient
                        | name = t name
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
                        |> Maybe.withDefault (emptyIngredient "")

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
                        |> Maybe.withDefault (emptyIngredient "")

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
                t =
                    L10n.t model.locale

                newIngredients =
                    editingIngredients
                        |> Array.push (emptyIngredient <| t "Farine")
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
                            |> List.filter (\( i, _ ) -> i /= index)
                            |> List.map Tuple.second
                            |> Array.fromList
                in
                ( { model | editingIngredients = newIngredients }, Cmd.none )

        ConvertIngredients ->
            ( { model | ingredients = Array.toList editingIngredients }, Cmd.none )

        Reinit ->
            let
                t =
                    L10n.t model.locale
            in
            ( { emptyModel
                | locale = model.locale
                , static = model.static
                , editingIngredients = Array.fromList [ emptyIngredient <| t <| kindToString Flour ]
              }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
