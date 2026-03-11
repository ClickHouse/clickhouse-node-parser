SELECT bitAnd(number, toUInt64(pow(2, 20) - 1)) as k, argMaxIf(k, number % 2 = 0 ? number : Null, number > 42),  uniq(number) AS u FROM numbers(1000000) GROUP BY k format Null;
