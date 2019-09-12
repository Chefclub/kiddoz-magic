module Data.Kiddoz exposing (Ingredient, Lists, emptyLists)


type alias Lists =
    { ingredients : List ( String, List String )
    , kitchenware : List String
    , units : List String
    }


type alias Ingredient =
    { name : String
    , quantity : String
    , unit : String
    }


emptyLists : Lists
emptyLists =
    { ingredients = []
    , kitchenware = []
    , units = []
    }
