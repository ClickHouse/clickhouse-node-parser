-- Nothing is working here :(
SELECT sum(y) AS s
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
GROUP BY x
ORDER BY x ASC;

SELECT replaceAll(trimLeft(`explain`), '__table1.', '')
FROM (
        EXPLAIN actions = 1, sorting = 1, description = 0
        SELECT sum(y) AS s
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
        ORDER BY x ASC
    )
WHERE ilike(`explain`, '%sort%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregat%');

SELECT sum(y) AS s
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
GROUP BY x
ORDER BY x DESC;

SELECT replaceAll(trimLeft(`explain`), '__table1.', '')
FROM (
        EXPLAIN actions = 1, sorting = 1, description = 0
        SELECT sum(y) AS s
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
        ORDER BY x DESC
    )
WHERE ilike(`explain`, '%sort%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregat%');

SELECT sum(y) AS s
FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
GROUP BY x
ORDER BY
    x ASC,
    s ASC;

SELECT replaceAll(trimLeft(`explain`), '__table1.', '')
FROM (
        EXPLAIN actions = 1, sorting = 1, description = 0
        SELECT sum(y) AS s
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
        ORDER BY
            x ASC,
            s ASC
    )
WHERE ilike(`explain`, '%sort%')
    OR like(`explain`, '%ReadFromMergeTree%')
    OR like(`explain`, '%Aggregat%');