SELECT fuzzBits(toFixedString('', 200), 0.99)
FROM numbers(1)
FORMAT Null;

SELECT fuzzBits(toFixedString('', 200), 0.99)
FROM numbers(128)
FORMAT Null;

SELECT fuzzBits(toFixedString('', 200), 0.99)
FROM numbers(60000)
FORMAT Null;