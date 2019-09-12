module Request.Lists exposing (decodeLists, getLists)

import Data.Kiddoz exposing (Lists)
import Http exposing (Error(..))
import Yaml.Decode as Decode exposing (Decoder)


getLists : (Result Error String -> msg) -> Cmd msg
getLists event =
    Http.get
        { url = "lists.yaml"
        , expect = Http.expectString event
        }


decodeLists : Decoder Lists
decodeLists =
    Decode.map3 Lists
        (Decode.field "ingredients" (Decode.list decodeIngredientList))
        (Decode.field "kitchenware" (Decode.list decodeUppercaseString))
        (Decode.field "units" (Decode.list decodeLowercaseString))


decodeUppercaseString : Decoder String
decodeUppercaseString =
    Decode.string
        |> Decode.andThen (String.toUpper >> Decode.succeed)


decodeLowercaseString : Decoder String
decodeLowercaseString =
    Decode.string
        |> Decode.andThen (String.toLower >> Decode.succeed)


decodeIngredientList : Decoder ( String, List String )
decodeIngredientList =
    Decode.map2 Tuple.pair
        (Decode.field "name" decodeUppercaseString)
        (Decode.field "units" (Decode.list decodeLowercaseString))
