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
    = Bicarbonate
    | Breadcrumbs
    | BrownSugar
    | Butter
    | Cilentro
    | Cinnamon
    | Cocoa
    | Curcuma
    | Curry
    | EggWhite
    | EggYellow
    | Flour
    | GrattedCheese
    | GroundAlmonds
    | GroundCoffee
    | Honey
    | IcingSugar
    | InstantCoffee
    | Jam
    | Liquid
    | Mustard
    | OatMeal
    | Parmesan
    | Pepper
    | PineNut
    | Polenta
    | Quinoa
    | Rice
    | Salt
    | Spread
    | Sugar
    | TomatoSauce
    | WheatSeed


existingIngredients : List Kind
existingIngredients =
    [ Bicarbonate
    , Breadcrumbs
    , BrownSugar
    , Butter
    , Cilentro
    , Cinnamon
    , Cocoa
    , Curcuma
    , Curry
    , EggWhite
    , EggYellow
    , Flour
    , GrattedCheese
    , GroundAlmonds
    , GroundCoffee
    , Honey
    , IcingSugar
    , InstantCoffee
    , Jam
    , Liquid
    , Mustard
    , OatMeal
    , Parmesan
    , Pepper
    , PineNut
    , Polenta
    , Quinoa
    , Rice
    , Salt
    , Spread
    , Sugar
    , TomatoSauce
    , WheatSeed
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
        Bicarbonate ->
            Just 0.87

        Breadcrumbs ->
            Just 0.45

        BrownSugar ->
            Just 0.61

        Butter ->
            Just (250 / 220)

        Cilentro ->
            Just 0.068

        Cinnamon ->
            Just 0.5

        Cocoa ->
            Just 0.44

        Curcuma ->
            Just 0.59

        Curry ->
            Just 0.57

        EggWhite ->
            Just 1.03

        EggYellow ->
            Just 1.13

        Flour ->
            Just (250 / 150)

        GrattedCheese ->
            Just (250 / 100)

        GroundAlmonds ->
            Just 0.36

        GroundCoffee ->
            Just 0.4

        Honey ->
            Just 1.4

        IcingSugar ->
            Just 0.5

        InstantCoffee ->
            Just 0.2

        Jam ->
            Just 1.37

        Liquid ->
            Just 1

        Mustard ->
            Just 1.05

        OatMeal ->
            Just 0.34

        Parmesan ->
            Just 0.42

        Pepper ->
            Just 0.5

        PineNut ->
            Just 0.55

        Polenta ->
            Just 0.75

        Quinoa ->
            Just 0.71

        Rice ->
            Just (250 / 200)

        Salt ->
            Just (250 / 340)

        Spread ->
            Just 1.05

        Sugar ->
            Just (250 / 230)

        TomatoSauce ->
            Just 0.91

        WheatSeed ->
            Just 0.75


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
        Bicarbonate ->
            "Bicarbonate"

        Breadcrumbs ->
            "Miettes de pain"

        BrownSugar ->
            "Cassonade"

        Butter ->
            "Beurre"

        Cilentro ->
            "Coriandre"

        Cinnamon ->
            "Cannelle"

        Cocoa ->
            "Chocolat"

        Curcuma ->
            "Curcuma"

        Curry ->
            "Curry"

        EggWhite ->
            "Blancs d'œufs"

        EggYellow ->
            "Jaunes d'œufs"

        Flour ->
            "Farine"

        GrattedCheese ->
            "Fromage râpé"

        GroundAlmonds ->
            "Amandes moulues"

        GroundCoffee ->
            "Café moulu"

        Honey ->
            "Miel"

        IcingSugar ->
            "Sucre glace"

        InstantCoffee ->
            "Café instantané"

        Jam ->
            "Confiture"

        Liquid ->
            "Liquides"

        Mustard ->
            "Moutarde"

        OatMeal ->
            "Flocons d'avoine"

        Parmesan ->
            "Parmesan"

        Pepper ->
            "Poivre"

        PineNut ->
            "Pignons"

        Polenta ->
            "Polenta"

        Quinoa ->
            "Quinoa"

        Rice ->
            "Riz"

        Salt ->
            "Sel"

        Spread ->
            "Pâte à tartiner"

        Sugar ->
            "Sucre en poudre"

        TomatoSauce ->
            "Sauce tomate"

        WheatSeed ->
            "Graines de blé"


kindFromName : String -> Maybe Kind
kindFromName kind =
    case kind of
        "Bicarbonate" ->
            Just Bicarbonate

        "Miettes de pain" ->
            Just Breadcrumbs

        "Cassonade" ->
            Just BrownSugar

        "Beurre" ->
            Just Butter

        "Coriandre" ->
            Just Cilentro

        "Cannelle" ->
            Just Cinnamon

        "Chocolat" ->
            Just Cocoa

        "Curcuma" ->
            Just Curcuma

        "Curry" ->
            Just Curry

        "Blancs d'œufs" ->
            Just EggWhite

        "Jaunes d'œufs" ->
            Just EggYellow

        "Farine" ->
            Just Flour

        "Fromage râpé" ->
            Just GrattedCheese

        "Amandes moulues" ->
            Just GroundAlmonds

        "Café moulu" ->
            Just GroundCoffee

        "Miel" ->
            Just Honey

        "Sucre glace" ->
            Just IcingSugar

        "Café instantané" ->
            Just InstantCoffee

        "Confiture" ->
            Just Jam

        "Liquides" ->
            Just Liquid

        "Moutarde" ->
            Just Mustard

        "Flocons d'avoine" ->
            Just OatMeal

        "Parmesan" ->
            Just Parmesan

        "Poivre" ->
            Just Pepper

        "Pignons" ->
            Just PineNut

        "Polenta" ->
            Just Polenta

        "Quinoa" ->
            Just Quinoa

        "Riz" ->
            Just Rice

        "Sel" ->
            Just Salt

        "Pâte à tartiner" ->
            Just Spread

        "Sucre en poudre" ->
            Just Sugar

        "Sauce tomate" ->
            Just TomatoSauce

        "Graines de blé" ->
            Just WheatSeed

        _ ->
            Nothing
