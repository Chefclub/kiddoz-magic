open Belt;

// We get a value in mL
// We want a list of cup

// Il faut savoir pour un montant donnée :
// - Le nombre de pièce
// - La liste des pièces
// + --- + ---------- +
// |  0  | 0  | []    |
// |  1  | 1  | [ 1 ] |
// + --- + ---------- +

// Anount, Available coins → Change coins list

// giveChange : Int -> List Int -> List Int
// giveChange initialAmount coins =

type changeInfo = {
  weight: int,
  change: list(int),
};

let kiddozCoins = [250, 245, 240, 125, 120, 85, 80, 65, 60, 15, 5];

let getListMinimum = list => {
  list->List.reduce(10000, (acc, curr) =>
    if (acc > curr) {
      curr;
    } else {
      acc;
    }
  );
};

let emptyChangeInfo = maxWeight => {weight: maxWeight, change: []};

let backtrackChange =
    (smallerCoin, coins, previousChangeInfo, currentChangeInfo, currentAmount) =>
  if (currentAmount == 0) {
    previousChangeInfo->Array.set(0, {weight: 0, change: []})->ignore;
    previousChangeInfo;
  } else {
    let candidates =
      coins->List.map(coin =>
        if (currentAmount >= coin) {
          let amountWithoutThisCoin = currentAmount - coin;
          let previousInfo =
            previousChangeInfo
            ->Array.get(amountWithoutThisCoin)
            ->Option.getWithDefault(emptyChangeInfo(currentAmount));
          if (previousInfo.weight + 1 < currentChangeInfo.weight) {
            {
              weight: previousInfo.weight + 1,
              change: List.concat([coin * smallerCoin], previousInfo.change),
            };
          } else {
            currentChangeInfo;
          };
        } else {
          currentChangeInfo;
        }
      );
    let lowerCandidate =
      candidates->List.reduce(
        emptyChangeInfo(currentAmount), (previousInfo, newInfo) =>
        if (previousInfo.weight < newInfo.weight) {
          previousInfo;
        } else {
          newInfo;
        }
      );
    previousChangeInfo->Array.set(currentAmount, lowerCandidate)->ignore;
    previousChangeInfo;
  };

let giveChange = (initialAmount, coinsList) => {
  let smallerCoin = getListMinimum(coinsList);
  let amountMax = (initialAmount / smallerCoin + 1) * smallerCoin;
  let amountMin = initialAmount / smallerCoin * smallerCoin;
  let mappedAmount =
    if (amountMax - initialAmount > initialAmount - amountMin) {
      amountMin / smallerCoin;
    } else {
      amountMax / smallerCoin;
    };

  let mappedCoins =
    coinsList->List.map(value =>
      Float.fromInt(value)
      /. Float.fromInt(smallerCoin)
      |> ceil
      |> int_of_float
    );
  let matrix = Array.make(mappedAmount + 1, emptyChangeInfo(mappedAmount));

  let result =
    Array.reduceWithIndex(
      matrix,
      matrix,
      backtrackChange(smallerCoin, mappedCoins),
    );

  Js.log2("matrix", result);
  result
  ->Array.reverse
  ->Array.get(0)
  ->Option.map(info => info.change->List.toArray)
  ->Option.getWithDefault([||]);
};

// Js.log2(
//   "200 mL in Kiddoz --> ",
//   giveChange(200, [250, 245, 240, 125, 120, 85, 80, 65, 60, 15, 5]),
// );

// Js.log2(
//   "30 mL in Kiddoz --> ",
//   giveChange(30, [250, 245, 240, 125, 120, 85, 80, 65, 60, 15, 5]),
// );

let default = giveChange;