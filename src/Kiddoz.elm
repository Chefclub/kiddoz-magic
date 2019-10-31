module Kiddoz exposing
    ( Kind(..)
    , Unit(..)
    , existingIngredients
    , existingUnits
    , food2mL
    , kindFromName
    , kindToString
    , unitFromName
    , unitToString
    , unitTomL
    )


type Kind
    = Flour
    | GroundAlmonds
    | Cocoa
    | OatMeal
    | WheatSeed
    | Bicarbonate
    | EggWhite
    | EggYellow
    | Jam
    | BrownSugar
    | IcingSugar
    | Sugar
    | Rice
    | Butter
    | Salt
    | GrattedCheese
    | Liquid
    | Cilentro
    | Curry
    | Curcuma
    | InstantCoffee
    | GroundCoffee
    | Cinnamon
    | Breadcrumbs
    | Honey
    | Mustard
    | Spread
    | Parmesan
    | PineNut
    | Polenta
    | Pepper
    | Quinoa
    | TomatoSauce


existingIngredients =
    [ Flour
    , GroundAlmonds
    , Cocoa
    , OatMeal
    , WheatSeed
    , Bicarbonate
    , EggWhite
    , EggYellow
    , Jam
    , BrownSugar
    , IcingSugar
    , Sugar
    , Rice
    , Butter
    , Salt
    , GrattedCheese
    , Liquid
    , Cilentro
    , Curry
    , Curcuma
    , InstantCoffee
    , GroundCoffee
    , Cinnamon
    , Breadcrumbs
    , Honey
    , Mustard
    , Spread
    , Parmesan
    , PineNut
    , Polenta
    , Pepper
    , Quinoa
    , TomatoSauce
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
        Flour ->
            Just (250 / 180)

        PineNut ->
            Just 0.55

        Polenta ->
            Just 0.75

        Cocoa ->
            Just 0.44

        Breadcrumbs ->
            Just 0.45

        Cinnamon ->
            Just 0.5

        InstantCoffee ->
            Just 0.2

        GroundCoffee ->
            Just 0.4

        Cilentro ->
            Just 0.068

        Curry ->
            Just 0.57

        Curcuma ->
            Just 0.59

        WheatSeed ->
            Just 0.75

        GroundAlmonds ->
            Just 0.36

        OatMeal ->
            Just 0.34

        Bicarbonate ->
            Just 0.87

        EggWhite ->
            Just 1.03

        EggYellow ->
            Just 1.13

        Sugar ->
            Just (250 / 230)

        BrownSugar ->
            Just 0.61

        IcingSugar ->
            Just 0.5

        Rice ->
            Just (250 / 200)

        Butter ->
            Just (250 / 220)

        Salt ->
            Just (250 / 340)

        GrattedCheese ->
            Just (250 / 100)

        Liquid ->
            Just 1

        Jam ->
            Just 1.37

        Honey ->
            Just 1.4

        Mustard ->
            Just 1.05

        Spread ->
            Just 1.05

        Parmesan ->
            Just 0.42

        Pepper ->
            Just 0.5

        Quinoa ->
            Just 0.71

        TomatoSauce ->
            Just 0.91


unitToString : Unit -> String
unitToString unit =
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
        Flour ->
            "Farine"

        PineNut ->
            "Pignons"

        Polenta ->
            "Polenta"

        Cocoa ->
            "Chocolat"

        Breadcrumbs ->
            "Miettes de pain"

        Cinnamon ->
            "Cannelle"

        InstantCoffee ->
            "Café instantané"

        GroundCoffee ->
            "Café moulu"

        Cilentro ->
            "Coriandre"

        Curry ->
            "Curry"

        Curcuma ->
            "Curcuma"

        WheatSeed ->
            "Graines de blé"

        GroundAlmonds ->
            "Amandes moulues"

        OatMeal ->
            "Flocons d'avoine"

        Bicarbonate ->
            "Bicarbonate"

        EggWhite ->
            "Blancs d'œufs"

        EggYellow ->
            "Jaunes d'œufs"

        Sugar ->
            "Sucre en poudre"

        BrownSugar ->
            "Cassonade"

        IcingSugar ->
            "Sucre glace"

        Rice ->
            "Riz"

        Butter ->
            "Beurre"

        Salt ->
            "Sel"

        GrattedCheese ->
            "Fromage râpé"

        Liquid ->
            "Liquides"

        Jam ->
            "Confiture"

        Honey ->
            "Miel"

        Mustard ->
            "Moutarde"

        Spread ->
            "Pâte à tartiner"

        Parmesan ->
            "Parmesan"

        Pepper ->
            "Poivre"

        Quinoa ->
            "Quinoa"

        TomatoSauce ->
            "Sauce tomate"


kindFromName : String -> Maybe Kind
kindFromName kind =
    case kind of
        "Farine" ->
            Just Flour

        "Pignons" ->
            Just PineNut

        "Polenta" ->
            Just Polenta

        "Chocolat" ->
            Just Cocoa

        "Miettes de pain" ->
            Just Breadcrumbs

        "Cannelle" ->
            Just Cinnamon

        "Café instantané" ->
            Just InstantCoffee

        "Café moulu" ->
            Just GroundCoffee

        "Coriandre" ->
            Just Cilentro

        "Curry" ->
            Just Curry

        "Curcuma" ->
            Just Curcuma

        "Graines de blé" ->
            Just WheatSeed

        "Amandes moulues" ->
            Just GroundAlmonds

        "Flocons d'avoine" ->
            Just OatMeal

        "Bicarbonate" ->
            Just Bicarbonate

        "Blancs d'œufs" ->
            Just EggWhite

        "Jaunes d'œufs" ->
            Just EggYellow

        "Sucre en poudre" ->
            Just Sugar

        "Cassonade" ->
            Just BrownSugar

        "Sucre glace" ->
            Just IcingSugar

        "Riz" ->
            Just Rice

        "Beurre" ->
            Just Butter

        "Sel" ->
            Just Salt

        "Fromage râpé" ->
            Just GrattedCheese

        "Liquides" ->
            Just Liquid

        "Confiture" ->
            Just Jam

        "Miel" ->
            Just Honey

        "Moutarde" ->
            Just Mustard

        "Pâte à tartiner" ->
            Just Spread

        "Parmesan" ->
            Just Parmesan

        "Poivre" ->
            Just Pepper

        "Quinoa" ->
            Just Quinoa

        "Sauce tomate" ->
            Just TomatoSauce

        _ ->
            Nothing
