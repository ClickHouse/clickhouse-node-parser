SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT json
        FROM test
        WHERE json.a = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT json
FROM test
WHERE json.a = 1;

SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT t
        FROM test
        WHERE t.a = 1
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT t
FROM test
WHERE t.a = 1;

SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT json
        FROM test
        WHERE json.`c[]`.d.:Int64 = [1]
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT json
FROM test
WHERE json.`c[]`.d.:Int64 = [1];

SELECT '------------------------------------------------------------------';