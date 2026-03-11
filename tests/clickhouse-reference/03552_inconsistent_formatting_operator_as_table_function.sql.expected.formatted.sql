SELECT *
FROM globalIn('a', 1);

SELECT *
FROM plus(1, 2);

SELECT *
FROM negate(x);

SELECT NOT((
        SELECT *
            AND (16)
    )
    AND 1);

SELECT negate([(1)]);

SELECT NOT((1, 1, 1));

SELECT
    ProfileEvents['LoadedMarksCount'],
    1
    OR toLowCardinality(1)
FROM `system`.nonexistent
PREWHERE *.1
    AND match(query, 'SELECT * FROM t_prewarm_add_column%')
    AND (currentDatabase() = current_database)
WHERE (notLike('SELECT * FROM t_prewarm_add_column%', query))
    AND (type = 'QueryFinish')
    AND (current_database = currentDatabase())
ORDER BY `ALL` DESC;

SELECT (((1), (2)));

SELECT
    tupleElement((1 AS c0), 1),
    tupleElement((1 AS c0), 1);

SELECT
    tuple(1 AS c0).1,
    tuple(1 AS c0).1;