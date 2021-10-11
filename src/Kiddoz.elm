module Kiddoz exposing
    ( Kind(..)
    , Unit(..)
    , existingIngredients
    , existingUnits
    , food2mL
    , kindFromName
    , kindToString
    , unitFromName
    , unitToSelectString
    , unitTomL
    )


type Kind
    = BakingPowder
    --| Bicarbonate
    | Breadcrumbs
    --| BrownSugar
    | Butter
    | ChocolateChips
    | ChocolatePieces
    --| Cilentro
    | Cinnamon
    | CocoaPowder
    | CrushedHazelnuts
    | Curcuma
    | Curry
    --| EggWhite
    --| EggYellow
    | Flour
    | GrattedCheese
    | GrattedMozzarella
    | GroundAlmonds
    --| GroundCoffee
    | Hazelnuts
    | Honey
    | IcingSugar
    --| InstantCoffee
    | Jam
    | Liquid
    | Mascarpone
    | Mustard
    | OatMeal
    | Parmesan
    --| Pepper
    --| PineNut
    --| Polenta
    --| Quinoa
    | Rice
    | Salt
    | Spread
    | Sugar
    --| TomatoSauce
    --| WheatSeed
    | Yogurt


existingIngredients : List Kind
existingIngredients =
    [ BakingPowder
    --, Bicarbonate
    , Breadcrumbs
    --, BrownSugar
    , Butter
    , ChocolateChips
    , ChocolatePieces
    --, Cilentro
    , Cinnamon
    , CocoaPowder
    , CrushedHazelnuts
    , Curcuma
    , Curry
    --, EggWhite
    --, EggYellow
    , Flour
    , GrattedCheese
    , GrattedMozzarella
    , GroundAlmonds
    --, GroundCoffee
    , Hazelnuts
    , Honey
    , IcingSugar
    --, InstantCoffee
    , Jam
    , Liquid
    , Mascarpone
    , Mustard
    , OatMeal
    , Parmesan
    --, Pepper
    --, PineNut
    --, Polenta
    --, Quinoa
    , Rice
    , Salt
    , Spread
    , Sugar
    --, TomatoSauce
    --, WheatSeed
    , Yogurt
    ]


type Unit
    = Grams
    | Centiliters
    | Milliliters
    | Cup -- Chef -- 250 mL
    | HalfCup -- Cochon -- 125 mL
    | ThirdCup -- Chat -- 80 mL
    | QuarterCup -- Souris -- 60 mL
    | Tablespoon -- Poule -- 15 mL
    | Teaspoon -- Poussin -- 5 mL
    | Oz -- 28g / 30mL
    | Unit


existingUnits : List Unit
existingUnits =
    [ Grams
    , Centiliters
    , Milliliters
    , Cup -- Chef -- 250 mL
    , HalfCup -- Cochon -- 125 mL
    , ThirdCup -- Chat -- 80 mL
    , QuarterCup -- Souris -- 60 mL
    , Tablespoon -- Poule -- 15 mL
    , Teaspoon -- Poussin -- 5 mL
    , Oz -- 28g / 30mL
    , Unit
    ]


food2mL : Kind -> Maybe Float
food2mL kind =
    case kind of
        BakingPowder ->
            Just (15 / 10)

{-         Bicarbonate ->
            Just 0.87
 -}
        Breadcrumbs ->
            Just (250 / 150)

{-         BrownSugar ->
            Just 0.61
 -}
        Butter ->
            Just (250 / 220)

        ChocolateChips ->
            Just (250 / 160)

        ChocolatePieces ->
            Just (250 / 175)

{-         Cilentro ->
            Just 0.068
 -}
        Cinnamon ->
            Just (30 / 15)

        CocoaPowder ->
            Just (250 / 120)

        CrushedHazelnuts ->
            Just (250 / 140)

        Curcuma ->
            Just (30 / 15)

        Curry ->
            Just (30 / 15)

{-         EggWhite ->
            Just 1.03

        EggYellow ->
            Just 1.13
 -}
        Flour ->
            Just (250 / 150)

        GrattedCheese ->
            Just (250 / 100)

        GrattedMozzarella ->
            Just (250 / 100)

        GroundAlmonds ->
            Just (250 / 140)

{-         GroundCoffee ->
            Just 0.4
 -}
        Hazelnuts ->
            Just (250 / 125)

        Honey ->
            Just (250 / 180)

        IcingSugar ->
            Just (250 / 150)

{-         InstantCoffee ->
            Just 0.2
 -}
        Jam ->
            Just (80 / 100)

        Liquid ->
            Just 1

        Mascarpone ->
            Just (250 / 250)

        Mustard ->
            Just (80 / 75)

        OatMeal ->
            Just (250 / 100)

        Parmesan ->
            Just (250 / 100)

{-         Pepper ->
            Just 0.5

        PineNut ->
            Just 0.55

        Polenta ->
            Just 0.75

        Quinoa ->
            Just 0.71
 -}
        Rice ->
            Just (250 / 200)

        Salt ->
            Just (15 / 20)

        Spread ->
            Just (80 / 75)

        Sugar ->
            Just (250 / 230)

{-         TomatoSauce ->
            Just 0.91

        WheatSeed ->
            Just 0.75
 -}
        Yogurt ->
            Just (250 / 250)


unitToSelectString : Unit -> String
unitToSelectString unit =
    case unit of
        Grams ->
            "grams"

        Centiliters ->
            "centiliters"

        Milliliters ->
            "milliliters"

        Cup ->
            "cup"

        HalfCup ->
            "½ cup"

        ThirdCup ->
            "⅓ cup"

        QuarterCup ->
            "¼ cup"

        Tablespoon ->
            "tbsp"

        Teaspoon ->
            "tsp"

        Oz ->
            "oz"

        Unit ->
            "piece"


unitFromName : String -> Unit
unitFromName unit =
    case unit of
        "grams" ->
            Grams

        "centiliters" ->
            Centiliters

        "milliliters" ->
            Milliliters

        "cup" ->
            Cup

        "½ cup" ->
            HalfCup

        "⅓ cup" ->
            ThirdCup

        "¼ cup" ->
            QuarterCup

        "tbsp" ->
            Tablespoon

        "tsp" ->
            Teaspoon

        "oz" ->
            Oz

        _ ->
            Unit


unitTomL : Unit -> Maybe Float
unitTomL unit =
    case unit of
        Grams ->
            Nothing

        Centiliters ->
            Just 10

        Milliliters ->
            Just 1

        Cup ->
            Just 250

        HalfCup ->
            Just 125

        ThirdCup ->
            Just 80

        QuarterCup ->
            Just 60

        Tablespoon ->
            Just 15

        Teaspoon ->
            Just 5

        Oz ->
            Just 30

        Unit ->
            Nothing


kindToString : Kind -> String
kindToString kind =
    case kind of
        BakingPowder ->
            "Levure"

{-         Bicarbonate ->
            "Bicarbonate"
 -}
        Breadcrumbs ->
            "Chapelure"

{-         BrownSugar ->
            "Cassonade"
 -}
        Butter ->
            "Beurre"

        ChocolateChips ->
            "Pépites de chocolat"

        ChocolatePieces ->
            "Morceaux de chocolat"

{-         Cilentro ->
            "Coriandre"
 -}
        Cinnamon ->
            "Cannelle"

        CocoaPowder ->
            "Cacao en poudre"

        CrushedHazelnuts ->
            "Noisettes concassées"

        Curcuma ->
            "Curcuma"

        Curry ->
            "Curry"

{-         EggWhite ->
            "Blancs d'œufs"

        EggYellow ->
            "Jaunes d'œufs"
 -}
        Flour ->
            "Farine"

        GrattedCheese ->
            "Fromage râpé"

        GrattedMozzarella ->
            "Mozzarella râpée"

        GroundAlmonds ->
            "Amandes moulues"

{-         GroundCoffee ->
            "Café moulu"
 -}
        Hazelnuts ->
            "Noisettes"

        Honey ->
            "Miel"

        IcingSugar ->
            "Sucre glace"

{-         InstantCoffee ->
            "Café instantané"
 -}
        Jam ->
            "Confiture"

        Liquid ->
            "Liquides"

        Mascarpone ->
            "Mascarpone"

        Mustard ->
            "Moutarde"

        OatMeal ->
            "Flocons d'avoine"

        Parmesan ->
            "Parmesan"

{-         Pepper ->
            "Poivre"

        PineNut ->
            "Pignons"

        Polenta ->
            "Polenta"

        Quinoa ->
            "Quinoa"
 -}
        Rice ->
            "Riz"

        Salt ->
            "Sel"

        Spread ->
            "Pâte à tartiner"

        Sugar ->
            "Sucre en poudre"

{-         TomatoSauce ->
            "Sauce tomate"

        WheatSeed ->
            "Graines de blé"
 -}
        Yogurt ->
            "Yaourt"


kindFromName : String -> Maybe Kind
kindFromName kind =
    case kind of
        "Levure" ->
            Just BakingPowder

{-         "Bicarbonate" ->
            Just Bicarbonate
 -}
        "Chapelure" ->
            Just Breadcrumbs

{-         "Cassonade" ->
            Just BrownSugar
 -}
        "Beurre" ->
            Just Butter

        "Pépites de chocolat" ->
            Just ChocolateChips

        "Morceaux de chocolat" ->
            Just ChocolatePieces

{-         "Coriandre" ->
            Just Cilentro
 -}
        "Cannelle" ->
            Just Cinnamon

        "Cacao en poudre" ->
            Just CocoaPowder

        "Noisettes concassées" ->
            Just CrushedHazelnuts

        "Curcuma" ->
            Just Curcuma

        "Curry" ->
            Just Curry

{-         "Blancs d'œufs" ->
            Just EggWhite

        "Jaunes d'œufs" ->
            Just EggYellow
 -}
        "Farine" ->
            Just Flour

        "Fromage râpé" ->
            Just GrattedCheese

        "Mozzarella râpée" ->
            Just GrattedMozzarella

        "Amandes moulues" ->
            Just GroundAlmonds

{-         "Café moulu" ->
            Just GroundCoffee
 -}
        "Noisettes" ->
            Just Hazelnuts

        "Miel" ->
            Just Honey

        "Sucre glace" ->
            Just IcingSugar

{-         "Café instantané" ->
            Just InstantCoffee
 -}
        "Confiture" ->
            Just Jam

        "Liquides" ->
            Just Liquid

        "Mascarpone" ->
            Just Mascarpone

        "Moutarde" ->
            Just Mustard

        "Flocons d'avoine" ->
            Just OatMeal

        "Parmesan" ->
            Just Parmesan

{-         "Poivre" ->
            Just Pepper

        "Pignons" ->
            Just PineNut

        "Polenta" ->
            Just Polenta

        "Quinoa" ->
            Just Quinoa
 -}
        "Riz" ->
            Just Rice

        "Sel" ->
            Just Salt

        "Pâte à tartiner" ->
            Just Spread

        "Sucre en poudre" ->
            Just Sugar

{-         "Sauce tomate" ->
            Just TomatoSauce

        "Graines de blé" ->
            Just WheatSeed
 -}
        "Yaourt" ->
            Just Yogurt

        _ ->
            Nothing
