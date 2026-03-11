SELECT sumResample(65535, 20, 1)(number, number % 20)
FROM numbers(200);