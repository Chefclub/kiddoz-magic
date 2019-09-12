module Data.Kiddoz exposing
    ( Ingredient
    , Kind(..)
    , Recipe
    , Section
    , Step
    , Unit(..)
    , emptyIngredient
    , emptyRecipe
    , emptySection
    , emptyStep
    , food2mL
    , unitTomL
    )


type alias Recipe =
    { title : String
    , sections : List Section
    }


emptyRecipe : Recipe
emptyRecipe =
    Recipe "" []


type alias Section =
    { title : String
    , ingredients : List Ingredient
    , steps : List Step
    }


emptySection : Section
emptySection =
    Section "" [] []


type alias Ingredient =
    { name : String
    , kind : Kind
    , quantity : Float
    , unit : Unit
    }


emptyIngredient : Ingredient
emptyIngredient =
    { name = ""
    , kind = Piece
    , quantity = 1
    , unit = Unit
    }


type alias Step =
    String


emptyStep : Step
emptyStep =
    ""


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
    | Piece
    | Cilentro
    | Curry
    | Curcuma
    | InstantCoffee
    | GroundCoffee
    | Cinnamon
    | Breadcrumbs
    | Oil
    | Honey
    | Mustard
    | Spread
    | Parmesan
    | PineNut
    | Polenta
    | Pepper
    | Quinoa
    | TomatoSauce


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


food2mL : Kind -> Maybe Float
food2mL kind =
    case kind of
        Flour ->
            Just (180 / 250)

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
            Just (230 / 250)

        BrownSugar ->
            Just 0.61

        IcingSugar ->
            Just 0.5

        Rice ->
            Just (200 / 250)

        Butter ->
            Just (220 / 250)

        Salt ->
            Just (340 / 250)

        GrattedCheese ->
            Just (100 / 250)

        Liquid ->
            Just 1

        Jam ->
            Just 1.37

        Oil ->
            Just 0.9

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

        Piece ->
            Nothing


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
