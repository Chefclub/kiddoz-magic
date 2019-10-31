module Types exposing (Flags, Ingredient, Model, Msg(..), emptyIngredient, emptyModel)

import Array exposing (Array)
import Kiddoz exposing (..)


type alias Flags =
    ()


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
    }


emptyModel : Model
emptyModel =
    { editingIngredients = Array.fromList [ emptyIngredient ]
    , ingredients = []
    }


type alias Ingredient =
    { name : String
    , kind : Maybe Kind
    , quantity : Int
    , unit : Unit
    }


emptyIngredient : Ingredient
emptyIngredient =
    { name = "Farine"
    , kind = Just Flour
    , quantity = 1
    , unit = Grams
    }
