SELECT cityHash64(toString(quantileDeterministicState(number, sipHash64(number))))
FROM numbers(8193);

SELECT hex(quantileDeterministicState(1, 1));