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
        "grams" ->
            "grammes"

        "centiliters" ->
            "centilitres"

        "milliliters" ->
            "mililitres"

        "cup" ->
            "cup"

        "½ cup" ->
            "½ cup"

        "⅓ cup" ->
            "⅓ cup"

        "¼ cup" ->
            "¼ cup"

        "tbsp" ->
            "c. à s."

        "tsp" ->
            "c. à c."

        "oz" ->
            "oz"

        "piece" ->
            "unité"

        _ ->
            key


translateDE : String -> String
translateDE key =
    case key of
        "Convertisseur de recettes" ->
            "Rezept-Konverter"

        "Ingrédient" ->
            "Zutat"

        "Quantité" ->
            "Menge"

        "Unité" ->
            "Einheit"

        "Convertir" ->
            "Konvertieren"

        "Recommencer" ->
            "Neu"

        " de " ->
            " "

        "Ta recette" ->
            "Dein Rezept"

        "Ta recette Kiddoz" ->
            "Dein Kiddoz Rezept"

        "grams" ->
            "Gramm"

        "centiliters" ->
            "Zentiliter"

        "milliliters" ->
            "Mililiter"

        "cup" ->
            "Cup"

        "½ cup" ->
            "½ Cup"

        "⅓ cup" ->
            "⅓ Cup"

        "¼ cup" ->
            "¼ Cup"

        "tbsp" ->
            "EL"

        "tsp" ->
            "TL"

        "oz" ->
            "oz"

        "piece" ->
            "Einheit"

        "Farine" ->
            "Mehl"

        "Pignons" ->
            "Pinienkerne"

        "Polenta" ->
            "Polenta"

        "Chocolat" ->
            "Schokolade"

        "Miettes de pain" ->
            "Brotkrümmel"

        "Cannelle" ->
            "Zimt"

        "Café instantané" ->
            "Instant Kaffee"

        "Café moulu" ->
            "Gemahlener Kaffee"

        "Coriandre" ->
            "Koriander"

        "Curry" ->
            "Curry"

        "Curcuma" ->
            "Kurkuma"

        "Graines de blé" ->
            "Weizenkörner"

        "Amandes moulues" ->
            "Gemahlene Mandeln"

        "Flocons d'avoine" ->
            "Haferflocken"

        "Bicarbonate" ->
            "Backpulver"

        "Blancs d'œufs" ->
            "Eiweiß"

        "Jaunes d'œufs" ->
            "Eigelb"

        "Sucre en poudre" ->
            "Zucker"

        "Cassonade" ->
            "Brauner Zucker"

        "Sucre glace" ->
            "Puderzucker"

        "Riz" ->
            "Reis"

        "Beurre" ->
            "Butter"

        "Sel" ->
            "Salz"

        "Fromage râpé" ->
            "Geriebener Käse"

        "Liquides" ->
            "Flüssigkeit"

        "Confiture" ->
            "Marmelade"

        "Miel" ->
            "Honig"

        "Moutarde" ->
            "Senf"

        "Pâte à tartiner" ->
            "Aufstrich"

        "Parmesan" ->
            "Parmesan"

        "Poivre" ->
            "Pfeffer"

        "Quinoa" ->
            "Quinoa"

        "Sauce tomate" ->
            "Tomatensoße"

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

        "Ta recette" ->
            "Your recipe"

        "Ta recette Kiddoz" ->
            "Your Kiddoz recipe"

        "grams" ->
            "grams"

        "centiliters" ->
            "centiliters"

        "milliliters" ->
            "mililiters"

        "cup" ->
            "cup"

        "½ cup" ->
            "½ cup"

        "⅓ cup" ->
            "⅓ cup"

        "¼ cup" ->
            "¼ cup"

        "tbsp" ->
            "tbsp"

        "tsp" ->
            "tsp"

        "oz" ->
            "oz"

        "piece" ->
            "piece"

        "Farine" ->
            "Floor"

        "Pignons" ->
            "Pinenut"

        "Polenta" ->
            "Polenta"

        "Chocolat" ->
            "Cocoa"

        "Miettes de pain" ->
            "Breadcrumbs"

        "Cannelle" ->
            "Cinnamon"

        "Café instantané" ->
            "Instant coffee"

        "Café moulu" ->
            "Ground coffee"

        "Coriandre" ->
            "Cilendro"

        "Curry" ->
            "Curry"

        "Curcuma" ->
            "Curcuma"

        "Graines de blé" ->
            "Wheat seed"

        "Amandes moulues" ->
            "Ground almonds"

        "Flocons d'avoine" ->
            "Oat meal"

        "Bicarbonate" ->
            "Bicarbonate"

        "Blancs d'œufs" ->
            "Egg white"

        "Jaunes d'œufs" ->
            "Egg yellow"

        "Sucre en poudre" ->
            "Sugar"

        "Cassonade" ->
            "Brown sugar"

        "Sucre glace" ->
            "Icing sugar"

        "Riz" ->
            "Rice"

        "Beurre" ->
            "Butter"

        "Sel" ->
            "Salt"

        "Fromage râpé" ->
            "Gratted cheese"

        "Liquides" ->
            "Liquids"

        "Confiture" ->
            "Jam"

        "Miel" ->
            "Honey"

        "Moutarde" ->
            "Mustard"

        "Pâte à tartiner" ->
            "Spread"

        "Parmesan" ->
            "Parmesan"

        "Poivre" ->
            "Pepper"

        "Quinoa" ->
            "Quinoa"

        "Sauce tomate" ->
            "Tomato sauce"

        _ ->
            key
