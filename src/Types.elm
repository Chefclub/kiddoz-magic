module Types exposing
    ( Flags
    , Ingredient
    , Locale(..)
    , Model
    , Msg(..)
    , emptyIngredient
    , emptyModel
    , localeFromString
    )

import Array exposing (Array)
import Kiddoz exposing (Kind(..), Unit(..))


type alias Flags =
    { static : String
    , locale : String
    }


type Msg
    = SetQuantity Int String
    | SetUnit Int String
    | SetKind Int String
    | AddIngredient
    | RemoveIngredient Int
    | ConvertIngredients
    | Reinit


type alias Model =
    { editingIngredients : Array Ingredient
    , ingredients : List Ingredient
    , static : String
    , locale : Locale
    }


type Locale
    = FR
    | DE
    | EN
    | IT
    | KR
    | BR
    | ES


localeFromString : String -> Locale
localeFromString l =
    let
        locale =
            String.toLower l
    in
    if String.startsWith "it" locale then
        IT
    else if String.startsWith "de" locale then
        DE
    else if String.startsWith "en" locale then
        EN
    else if String.startsWith "pt-br" locale then
        BR
    else if String.startsWith "ko" locale then
        KR
    else if String.startsWith "es" locale then
        ES
    else
        FR


emptyModel : Model
emptyModel =
    { editingIngredients = Array.fromList [ emptyIngredient "" ]
    , ingredients = []
    , locale = FR
    , static = "assets/"
    }


type alias Ingredient =
    { name : String
    , kind : Maybe Kind
    , quantity : Int
    , unit : Unit
    }


emptyIngredient : String -> Ingredient
emptyIngredient name =
    { name = name
    , kind = Just Flour
    , quantity = 100
    , unit = Grams
    }
