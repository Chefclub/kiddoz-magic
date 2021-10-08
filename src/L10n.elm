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

        ES ->
            translateES

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

        "Ta recette Chefclub Kids" ->
            "Dein Chefclub Kids Rezept"

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

        "Chapelure" ->
            "Paniermehl"

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

        "Mozzarella râpée" ->
            "Geriebener Mozzarella"

        "Liquides" ->
            "Flüssigkeit"

        "Confiture" ->
            "Marmelade"

        "Miel" ->
            "Honig"

        "Mascarpone" ->
            "Mascarpone"

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

        "Yaourt" ->
            "Joghurt"

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

        "Ta recette Chefclub Kids" ->
            "La tua ricetta in Chefclub Kids"

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

        "Chapelure" ->
            "Pangrattato"

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

        "Mozzarella râpée" ->
            "Mozzarella grattugiata"

        "Liquides" ->
            "Liquidi"

        "Confiture" ->
            "Marmellata"

        "Miel" ->
            "Miele"

        "Mascarpone" ->
            "Mascarpone"

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

        "Yaourt" ->
            "Yogurt"

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

        "Ta recette Chefclub Kids" ->
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

        "Chapelure" ->
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

        "Mozzarella râpée" ->
            "슈레드 모짜렐라"

        "Liquides" ->
            "액체"

        "Confiture" ->
            "잼"

        "Miel" ->
            "꿀"

        "Mascarpone" ->
            "마스카르포네 치즈"

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

        "Yaourt" ->
            "그릭 요거트"

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

        "Ta recette Chefclub Kids" ->
            "A sua receita em Chefclub Kids"

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

        "Chapelure" ->
            "Farinha de rosca"

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

        "Mozzarella râpée" ->
            "Muçarela ralada"

        "Liquides" ->
            "Líquidos"

        "Confiture" ->
            "Geléia"

        "Miel" ->
            "Mel"

        "Mascarpone" ->
            "Mascarpone"

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

        "Yaourt" ->
            "Iogurte"

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

        "Ta recette Chefclub Kids" ->
            "Your Chefclub Kids recipe"

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

        "Chapelure" ->
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

        "Mozzarella râpée" ->
            "Shredded mozzarella"

        "Liquides" ->
            "Liquids"

        "Confiture" ->
            "Jam"

        "Miel" ->
            "Honey"

        "Mascarpone" ->
            "Mascarpone cheese"

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

        "Yaourt" ->
            "Yoghurt"

        _ ->
            key


translateES : String -> String
translateES key =
    case key of
        "Convertisseur de recettes" ->
            "Convertidor de recetas"

        "Ingrédient" ->
            "Ingrediente"

        "Quantité" ->
            "Cantidad"

        "Unité" ->
            "Unidad"

        "Convertir" ->
            "Convertir"

        "Recommencer" ->
            "Volver a empezar"

        " de " ->
            " de "

        "Ta recette" ->
            "Tu receta"

        "Ta recette Chefclub Kids" ->
            "Tu receta Chefclub Kids"

        "grams" ->
            "gramos"

        "centiliters" ->
            "centilitros"

        "milliliters" ->
            "mililitros"

        "cup" ->
            "taza"

        "½ cup" ->
            "½ de taza"

        "⅓ cup" ->
            "⅓ de taza"

        "¼ cup" ->
            "¼ de taza"

        "tbsp" ->
            "cda"

        "tsp" ->
            "cdta"

        "oz" ->
            "onz"

        "piece" ->
            "pedazo"

        "Farine" ->
            "Harina"

        "Pignons" ->
            "Piñón"

        "Polenta" ->
            "Polenta"

        "Chocolat" ->
            "Chocolate"

        "Chapelure" ->
            "Pan rallado"

        "Cannelle" ->
            "Canela"

        "Café instantané" ->
            "Café Instantáneo"

        "Café moulu" ->
            "Café molido"

        "Coriandre" ->
            "Cilantro"

        "Curry" ->
            "Curry"

        "Curcuma" ->
            "Cúrcuma"

        "Graines de blé" ->
            "Granos de trigo"

        "Amandes moulues" ->
            "Almendra molida"

        "Flocons d'avoine" ->
            "Avena"

        "Bicarbonate" ->
            "Bicarbonato de sodio"

        "Blancs d'œufs" ->
            "Claras de huevo"

        "Jaunes d'œufs" ->
            "Yemas de huevo"

        "Sucre en poudre" ->
            "Azúcar"

        "Cassonade" ->
            "Azúcar morena"

        "Sucre glace" ->
            "Azúcar glass"

        "Riz" ->
            "Arroz"

        "Beurre" ->
            "Mantequilla"

        "Sel" ->
            "Sal"

        "Fromage râpé" ->
            "Queso rallado"

        "Mozzarella râpée" ->
            "Mozzarella rallada"

        "Liquides" ->
            "Líquidos"

        "Confiture" ->
            "Mermelada"

        "Miel" ->
            "Miel"

        "Mascarpone" ->
            "Mascarpone"

        "Moutarde" ->
            "Mostaza"

        "Pâte à tartiner" ->
            "Crema para untar"

        "Parmesan" ->
            "Parmesano"

        "Poivre" ->
            "Pimienta"

        "Quinoa" ->
            "Quinoa"

        "Sauce tomate" ->
            "Salsa de tomate"

        "Yaourt" ->
            "Yogurt"

        _ ->
            key
