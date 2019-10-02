module Change exposing (ChangeInfo, backTrackChange, coinsList, emptyChangeInfo, giveChange)

import Array exposing (Array)



-- Algorithm explaination: https://www.youtube.com/watch?v=jgiZlGzXMBw


type alias ChangeInfo =
    { amount : Int
    , weight : Int
    , change : List Int
    }


emptyChangeInfo : Int -> Int -> ChangeInfo
emptyChangeInfo maxWeight currentAmount =
    ChangeInfo currentAmount maxWeight []


coinsList : List Int
coinsList =
    [ 250, 245, 240, 125, 120, 85, 80, 65, 60, 15, 5 ]


giveChange : Int -> List Int -> List Int
giveChange initialAmount coins =
    case List.minimum coins of
        Nothing ->
            []

        Just min_coin ->
            let
                amount_max =
                    (initialAmount // min_coin + 1) * min_coin

                amount_min =
                    (initialAmount // min_coin) * min_coin

                -- We take the multiple of 5 the closest
                amount =
                    if amount_max - initialAmount > initialAmount - amount_min then
                        amount_min

                    else
                        amount_max

                new_coins =
                    coins
                        |> List.map (\coin -> toFloat coin / toFloat min_coin |> ceiling)

                matrix =
                    -- Initialise the empty matrix to fill up
                    List.range 0 (amount // min_coin)
                        |> List.map (emptyChangeInfo <| amount)
                        |> Array.fromList

                possible_things =
                    matrix
                        |> Array.foldl (backTrackChange min_coin new_coins) matrix
            in
            possible_things
                |> Array.toList
                |> List.reverse
                |> List.head
                |> Maybe.map .change
                |> Maybe.withDefault []



-- Recursive backtracking


backTrackChange : Int -> List Int -> ChangeInfo -> Array ChangeInfo -> Array ChangeInfo
backTrackChange min_coin coins currentInfo previousInfos =
    if currentInfo.amount == 0 then
        -- The amount 0 needs no coins
        Array.set 0 { currentInfo | weight = 0 } previousInfos

    else
        let
            candidates =
                coins
                    |> List.map
                        (\coin ->
                            if currentInfo.amount >= coin then
                                let
                                    previousMap =
                                        currentInfo.amount - coin

                                    previousInfo =
                                        Array.get previousMap previousInfos
                                            |> Maybe.withDefault (emptyChangeInfo 10000 previousMap)
                                in
                                if previousInfo.weight + 1 < currentInfo.weight then
                                    { currentInfo | weight = previousInfo.weight + 1, change = coin * min_coin :: previousInfo.change }

                                else
                                    currentInfo

                            else
                                currentInfo
                        )

            minimum =
                candidates
                    |> List.map .weight
                    |> List.minimum
                    |> Maybe.withDefault 0

            lowerCandidate =
                candidates
                    |> List.filter (\changeInfo -> changeInfo.weight == minimum)
                    |> List.head
        in
        case lowerCandidate of
            Nothing ->
                previousInfos

            Just candidate ->
                Array.set currentInfo.amount candidate previousInfos
