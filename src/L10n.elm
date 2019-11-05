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
        "Convertisseur de recettes" ->
            "Rezept-Konverter"

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

        "Ta recette" ->
            "Your recipe"

        "Ta recette Kiddoz" ->
            "Your Kiddoz recipe"

        --         "grams" ->
        --             key
        --
        --         "centiliters" ->
        --             key
        --
        --         "milliliters" ->
        --             key
        --
        --         "cup" ->
        --             key
        --
        --         "½ cup" ->
        --             key
        --
        --         "⅓ cup" ->
        --             key
        --
        --         "¼ cup" ->
        --             key
        --
        --         "tbsp" ->
        --             key
        --
        --         "tsp" ->
        --             key
        --
        --         "oz" ->
        --             key
        --
        --         "piece" ->
        --             key
        --
        --         "Farine" ->
        --             key
        --
        --         "Pignons" ->
        --             key
        --
        --         "Polenta" ->
        --             key
        --
        --         "Chocolat" ->
        --             key
        --
        --         "Miettes de pain" ->
        --             key
        --
        --         "Cannelle" ->
        --             key
        --
        --         "Café instantané" ->
        --             key
        --
        --         "Café moulu" ->
        --             key
        --
        --         "Coriandre" ->
        --             key
        --
        --         "Curry" ->
        --             key
        --
        --         "Curcuma" ->
        --             key
        --
        --         "Graines de blé" ->
        --             key
        --
        --         "Amandes moulues" ->
        --             key
        --
        --         "Flocons d'avoine" ->
        --             key
        --
        --         "Bicarbonate" ->
        --             key
        --
        --         "Blancs d'œufs" ->
        --             key
        --
        --         "Jaunes d'œufs" ->
        --             key
        --
        --         "Sucre en poudre" ->
        --             key
        --
        --         "Cassonade" ->
        --             key
        --
        --         "Sucre glace" ->
        --             key
        --
        --         "Riz" ->
        --             key
        --
        --         "Beurre" ->
        --             key
        --
        --         "Sel" ->
        --             key
        --
        --         "Fromage râpé" ->
        --             key
        --
        --         "Liquides" ->
        --             key
        --
        --         "Confiture" ->
        --             key
        --
        --         "Miel" ->
        --             key
        --
        --         "Moutarde" ->
        --             key
        --
        --         "Pâte à tartiner" ->
        --             key
        --
        --         "Parmesan" ->
        --             key
        --
        --         "Poivre" ->
        --             key
        --
        --         "Quinoa" ->
        --             key
        --
        --         "Sauce tomate" ->
        --             key
        _ ->
            key
