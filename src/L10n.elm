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

        IT ->
            translateIT

        BR ->
            translateBR

        KR ->
            translateKR

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


translateIT : String -> String
translateIT key =
    case key of
        "Convertisseur de recettes" ->
            "convertitore di ricette"

        "Ingrédient" ->
            "Ingrediente"

        "Quantité" ->
            "Quantità"

        "Unité" ->
            "Unità"

        "Convertir" ->
            "Convertire"

        "Recommencer" ->
            "Ricominciare"

        " de " ->
            " di "

        "Ta recette" ->
            "La tua ricetta"

        "Ta recette Kiddoz" ->
            "La tua ricetta in Kiddoz"

        "grams" ->
            "grammi"

        "centiliters" ->
            "centilitri"

        "milliliters" ->
            "millilitri"

        "cup" ->
            "tazze"

        "½ cup" ->
            "½ tazze"

        "⅓ cup" ->
            "⅓ tazze"

        "¼ cup" ->
            "¼ tazze"

        "tbsp" ->
            "tbsp"

        "tsp" ->
            "tsp"

        "oz" ->
            "oz"

        "piece" ->
            "pezzo"

        "Farine" ->
            "Farina"

        "Pignons" ->
            "Pinoli"

        "Polenta" ->
            "Polenta"

        "Chocolat" ->
            "Cioccolato"

        "Miettes de pain" ->
            "Briciole di pane"

        "Cannelle" ->
            "Cannella"

        "Café instantané" ->
            "Caffè solubile"

        "Café moulu" ->
            "Caffè in polvere"

        "Coriandre" ->
            "Coriandolo"

        "Curry" ->
            "Curry"

        "Curcuma" ->
            "Curcuma"

        "Graines de blé" ->
            "Chicchi di grano"

        "Amandes moulues" ->
            "Farina di mandorle"

        "Flocons d'avoine" ->
            "Fiocchi d'avena"

        "Bicarbonate" ->
            "Bicarbonato"

        "Blancs d'œufs" ->
            "Albumi"

        "Jaunes d'œufs" ->
            "Tuorli"

        "Sucre en poudre" ->
            "Zucchero"

        "Cassonade" ->
            "Zucchero di canna"

        "Sucre glace" ->
            "Zucchero a velo"

        "Riz" ->
            "Riso"

        "Beurre" ->
            "Burro"

        "Sel" ->
            "Sale"

        "Fromage râpé" ->
            "Formaggio grattugiato"

        "Liquides" ->
            "Liquidi"

        "Confiture" ->
            "Marmellata"

        "Miel" ->
            "Miele"

        "Moutarde" ->
            "Mostarda"

        "Pâte à tartiner" ->
            "Crema spalmabile"

        "Parmesan" ->
            "Parmigiano"

        "Poivre" ->
            "Pepe"

        "Quinoa" ->
            "Quinoa"

        "Sauce tomate" ->
            "Passata di pomodoro"

        _ ->
            key


translateKR : String -> String
translateKR key =
    case key of
        "Convertisseur de recettes" ->
            "레시피 변환기"

        "Ingrédient" ->
            "재료"

        "Quantité" ->
            "양"

        "Unité" ->
            "단위"

        "Convertir" ->
            "변환하기"

        "Recommencer" ->
            "다시 시작"

        " de " ->
            ""

        "Ta recette" ->
            "당신의 레시피"

        "Ta recette Kiddoz" ->
            "당신의 키도즈 레시피"

        "grams" ->
            "g"

        "centiliters" ->
            "cl"

        "milliliters" ->
            "ml"

        "cup" ->
            "컵"

        "½ cup" ->
            "½ 컵"

        "⅓ cup" ->
            "⅓ 컵"

        "¼ cup" ->
            "¼ 컵"

        "tbsp" ->
            "큰술"

        "tsp" ->
            "작은술"

        "oz" ->
            "oz"

        "piece" ->
            "개"

        "Farine" ->
            "밀가루"

        "Pignons" ->
            "잣"

        "Polenta" ->
            "폴렌타"

        "Chocolat" ->
            "초콜릿"

        "Miettes de pain" ->
            "빵가루"

        "Cannelle" ->
            "계피가루"

        "Café instantané" ->
            "인스턴트커피"

        "Café moulu" ->
            "가루커피"

        "Coriandre" ->
            "고수"

        "Curry" ->
            "커리"

        "Curcuma" ->
            "강황가루"

        "Graines de blé" ->
            "보리콩"

        "Amandes moulues" ->
            "아몬드 가루e"

        "Flocons d'avoine" ->
            "오트밀"

        "Bicarbonate" ->
            "베이킹소다"

        "Blancs d'œufs" ->
            "계란 흰자"

        "Jaunes d'œufs" ->
            "계란 노른자"

        "Sucre en poudre" ->
            "설탕"

        "Cassonade" ->
            "흑설탕"

        "Sucre glace" ->
            "슈가 파우더"

        "Riz" ->
            "쌀"

        "Beurre" ->
            "버터"

        "Sel" ->
            "소금"

        "Fromage râpé" ->
            "슈레드 치즈"

        "Liquides" ->
            "액체"

        "Confiture" ->
            "잼"

        "Miel" ->
            "꿀"

        "Moutarde" ->
            "겨자"

        "Pâte à tartiner" ->
            "스프레드"

        "Parmesan" ->
            "파마산 치즈"

        "Poivre" ->
            "후추"

        "Quinoa" ->
            "퀴노아"

        "Sauce tomate" ->
            "토마토 소스"

        _ ->
            key


translateBR : String -> String
translateBR key =
    case key of
        "Convertisseur de recettes" ->
            "Conversor de receitas"

        "Ingrédient" ->
            "Ingrediente"

        "Quantité" ->
            "Quantidade"

        "Unité" ->
            "Unidade"

        "Convertir" ->
            "Convertir"

        "Recommencer" ->
            "Recomeçar"

        " de " ->
            " de "

        "Ta recette" ->
            "A sua receita"

        "Ta recette Kiddoz" ->
            "A sua receita em Kiddoz"

        "grams" ->
            "gramas"

        "centiliters" ->
            "centilitros"

        "milliliters" ->
            "mililitros"

        "cup" ->
            "copo"

        "½ cup" ->
            "½ copo"

        "⅓ cup" ->
            "⅓ copo"

        "¼ cup" ->
            "¼ copo"

        "tbsp" ->
            "colher de sopa"

        "tsp" ->
            "colher de chá"

        "oz" ->
            "onça"

        "piece" ->
            "unidade"

        "Farine" ->
            "Farinha"

        "Pignons" ->
            "Pinoli"

        "Polenta" ->
            "Polenta"

        "Chocolat" ->
            "Chocolate"

        "Miettes de pain" ->
            "Migalhas de pão"

        "Cannelle" ->
            "Canela"

        "Café instantané" ->
            "Café solúvel"

        "Café moulu" ->
            "Café moído"

        "Coriandre" ->
            "Coentro"

        "Curry" ->
            "Curry"

        "Curcuma" ->
            "Cúrcuma"

        "Graines de blé" ->
            "Grãos de trigo"

        "Amandes moulues" ->
            "Amêndoa moída"

        "Flocons d'avoine" ->
            "Flocos de aveia"

        "Bicarbonate" ->
            "Bicarbonato"

        "Blancs d'œufs" ->
            "Claras de ovos"

        "Jaunes d'œufs" ->
            "Gemas de ovos"

        "Sucre en poudre" ->
            "Açúcar"

        "Cassonade" ->
            "Açúcar mascavo"

        "Sucre glace" ->
            "Açúcar de confeiteiro"

        "Riz" ->
            "Arroz"

        "Beurre" ->
            "Manteiga"

        "Sel" ->
            "Sal"

        "Fromage râpé" ->
            "Queijo ralado"

        "Liquides" ->
            "Líquidos"

        "Confiture" ->
            "Geléia"

        "Miel" ->
            "Mel"

        "Moutarde" ->
            "Mostarda"

        "Pâte à tartiner" ->
            "Creme"

        "Parmesan" ->
            "Parmesão"

        "Poivre" ->
            "Pimenta"

        "Quinoa" ->
            "Quinoa"

        "Sauce tomate" ->
            "Molho de tomate"

        _ ->
            key


translateEN : String -> String
translateEN key =
    case key of
        "Convertisseur de recettes" ->
            "Recipe converter"

        "Ingrédient" ->
            "Ingredient"

        "Quantité" ->
            "Quantity"

        "Unité" ->
            "Unit"

        "Convertir" ->
            "Convert"

        "Recommencer" ->
            "Start Over"

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
            "Flour"

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
            "Cilantro"

        "Curry" ->
            "Curry"

        "Curcuma" ->
            "Tumeric"

        "Graines de blé" ->
            "Wheat berries"

        "Amandes moulues" ->
            "Ground almonds"

        "Flocons d'avoine" ->
            "Oatmeal"

        "Bicarbonate" ->
            "Baking soda"

        "Blancs d'œufs" ->
            "Egg white"

        "Jaunes d'œufs" ->
            "Egg yolk"

        "Sucre en poudre" ->
            "Sugar"

        "Cassonade" ->
            "Brown sugar"

        "Sucre glace" ->
            "Powdered sugar"

        "Riz" ->
            "Rice"

        "Beurre" ->
            "Butter"

        "Sel" ->
            "Salt"

        "Fromage râpé" ->
            "Shredded cheese"

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
