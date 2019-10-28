module Data.Types exposing (Editing(..), Flags, Model, Msg(..))

import Data.Kiddoz exposing (..)


type alias Flags =
    ()


type alias Model =
    { recipe : Recipe
    , selectedIngredient : Ingredient
    , editing : Editing
    }


type Msg
    = SetQuantity String
    | SetName String
    | SetUnit String
    | SetKind String
    | SetEditing Editing
    | SetTitle String
    | AddIngredient
    | Remove String
    | NoOp
    | AddNewStep String
    | EditStep String String


type Editing
    = NoEdition
    | Title
    | StepAdd String
    | StepEdit String String
