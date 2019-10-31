module L10n exposing (t)

import Types exposing (Locale(..))


t : Locale -> String -> String
t locale =
    case locale of
        FR ->
            translateFR

        EN ->
            translateEN

        DE ->
            translateDE


translateFR : String -> String
translateFR key =
    case key of
        _ ->
            key


translateDE : String -> String
translateDE key =
    case key of
        _ ->
            key


translateEN : String -> String
translateEN key =
    case key of
        "Convertisseur de recettes" ->
            "Recipe's converter"

        "Ingrédient" ->
            "Ingredient"

        "Quantité" ->
            "Quantity"

        "Unité" ->
            "Unit"

        "Convertir" ->
            "Convert"

        "Recommencer" ->
            "Reinit"

        " de " ->
            " of "

        "Farine" ->
            "Flour"

        _ ->
            key
