-- Verify granules selected for the next 5 queries
SELECT splitByChar('/', trimLeft(`explain`))[1]
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM rmt1 FINAL
        WHERE id = 25
            AND val = 88888888
    )
WHERE like(`explain`, '%Granules:%');

SELECT splitByChar('/', trimLeft(`explain`))[1]
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM rmt1 FINAL
        WHERE id < 1000
            AND val = 88888888
    )
WHERE like(`explain`, '%Granules:%');

-- PK selects more granules but intersection will be lesser
SELECT splitByChar('/', trimLeft(`explain`))[1]
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM rmt1 FINAL
        WHERE id > 18000
            AND id < 19500
            AND val = 99999999
    )
WHERE like(`explain`, '%Granules:%');

SELECT splitByChar('/', trimLeft(`explain`))[1]
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM rmt1 FINAL
        WHERE id IN (100, 500, 12000, 18000)
            AND val = 88888888
    )
WHERE like(`explain`, '%Granules:%');

SELECT splitByChar('/', trimLeft(`explain`))[1]
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM rmt1 FINAL
        WHERE ((and(greaterOrEquals(id, 650), lessOrEquals(id, 900))
            OR and(greaterOrEquals(id, 8000), lessOrEquals(id, 9000))
            OR and(greaterOrEquals(id, 12000), lessOrEquals(id, 13000))
            AND and(greaterOrEquals(id, 16000), lessOrEquals(id, 16500))))
            AND val = 88888888
    )
WHERE like(`explain`, '%Granules:%');

-- execute the queries to verify ranges are correctly added
SELECT count(*)
FROM rmt1 FINAL
WHERE id = 25
    AND val = 88888888;

SELECT count(*)
FROM rmt1 FINAL
WHERE id < 1000
    AND val = 88888888;

SELECT count(*)
FROM rmt1 FINAL
WHERE id > 18000
    AND id < 19500
    AND val = 99999999;

SELECT count(*)
FROM rmt1 FINAL
WHERE id IN (100, 500, 12000, 18000)
    AND val = 88888888;

SELECT count(*)
FROM rmt1 FINAL
WHERE ((and(greaterOrEquals(id, 650), lessOrEquals(id, 900))
    OR and(greaterOrEquals(id, 8000), lessOrEquals(id, 9000))
    OR and(greaterOrEquals(id, 12000), lessOrEquals(id, 13000))
    AND and(greaterOrEquals(id, 16000), lessOrEquals(id, 16500))))
    AND val = 88888888;