def change_making(coins, amount):
    """Calculate a matrix of all the amount from 0 to the expected one.

    - For each coin, if the coin is lower than the amount, see if the
      number of coin needed to reach the amount minus the value of the
      coin is greater than the previous shorter step + 1 coin.
    - If it is better, keep this new solution, if not try the next coin.

    - When we reach the best solution, we keep the list of coins needed

    Algoithm explainations: https://www.youtube.com/watch?v=jgiZlGzXMBw
    """

    min_coin = min(coins)

    amount_max = ((amount // min_coin) + 1) * min_coin
    amount_min = (amount // min_coin) * min_coin

    if amount_max - amount < amount - amount_min:
        amount = amount_max
    else:
        amount = amount_min

    new_coins = [coin // min_coin for coin in coins]
    
    matrix = [amount // min_coin + 1 for _ in range(0, amount // min_coin + 1)]
    change = [[] for _ in range(0, amount // min_coin + 1)]

    for current_amount, current_weight in enumerate(matrix):
        if current_amount == 0:
            matrix[0] = 0
            continue

        for c in range(len(new_coins)):
            current_coin = new_coins[c]
            if current_coin <= current_amount:
                previous_map = current_amount - current_coin
                previous_weight = matrix[previous_map]

                if previous_weight + 1 < current_weight:
                    matrix[current_amount] = previous_weight + 1
                    change[current_amount] = [*change[previous_map], current_coin * min_coin]
                    current_weight = previous_weight + 1

    return matrix[-1], change[-1]

print(change_making([ 5, 15, 60, 80, 125, 250 ], 300))
