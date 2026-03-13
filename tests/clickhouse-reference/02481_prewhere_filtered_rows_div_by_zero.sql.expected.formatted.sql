SELECT
    _part_offset,
    intDiv(_part_offset, 3) AS granule,
    *
FROM test_filter
ORDER BY _part_offset ASC;

-- Check that division by zero occurs on some rows
SELECT intDiv(b, c)
FROM test_filter; -- { serverError ILLEGAL_DIVISION }

-- Filter out those rows using WHERE or PREWHERE
SELECT intDiv(b, c)
FROM test_filter
WHERE c != 0;

SELECT intDiv(b, c)
FROM test_filter
PREWHERE c != 0;

SELECT intDiv(b, c)
FROM test_filter
PREWHERE c != 0
WHERE b % 2 != 0;

SELECT *
FROM test_filter
PREWHERE intDiv(b, c) > 0;

SELECT *
FROM test_filter
PREWHERE b != 0
WHERE intDiv(b, c) > 0;