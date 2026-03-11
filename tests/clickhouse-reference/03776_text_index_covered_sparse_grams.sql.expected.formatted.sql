SELECT sparseGrams(lower('the fastest OLAP database'), 3, 20, 5);

SELECT s
FROM tab
WHERE like(s, '%the fastest OLAP database%');

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT s
        FROM tab
        WHERE like(s, '%the fastest OLAP database%')
    )
WHERE like(`explain`, '%Condition:%');