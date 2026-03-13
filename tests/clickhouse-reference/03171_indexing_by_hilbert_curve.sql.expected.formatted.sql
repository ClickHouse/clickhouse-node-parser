SELECT count()
FROM test_hilbert_encode
WHERE x >= 10
    AND x <= 20
    AND y >= 20
    AND y <= 30;

-- Various other conditions
SELECT count()
FROM test_hilbert_encode
WHERE x = 10
SETTINGS max_rows_to_read = 49;

SELECT count()
FROM test_hilbert_encode
WHERE x = 10
    AND y > 10
SETTINGS max_rows_to_read = 33;

SELECT count()
FROM test_hilbert_encode
WHERE x = 10
    AND y < 10
SETTINGS max_rows_to_read = 15;

SELECT count()
FROM test_hilbert_encode
WHERE y = 10
SETTINGS max_rows_to_read = 50;

SELECT count()
FROM test_hilbert_encode
WHERE x >= 10
    AND y = 10
SETTINGS max_rows_to_read = 35;

SELECT count()
FROM test_hilbert_encode
WHERE y = 10
    AND x <= 10
SETTINGS max_rows_to_read = 17;

SELECT count()
FROM test_hilbert_encode
PREWHERE x >= 10
WHERE x < 11
    AND y = 10
SETTINGS max_rows_to_read = 2;