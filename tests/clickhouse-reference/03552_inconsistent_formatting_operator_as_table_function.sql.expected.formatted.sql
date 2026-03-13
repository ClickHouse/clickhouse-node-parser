SELECT *
FROM globalIn('a', 1); -- { serverError UNKNOWN_FUNCTION }

SELECT *
FROM plus(1, 2); -- { serverError UNKNOWN_FUNCTION }

SELECT *
FROM negate(x); -- { serverError UNKNOWN_FUNCTION }

SELECT NOT((
        SELECT *
            AND (16)
    )
    AND 1);

SELECT negate([(1)]); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT NOT((1, 1, 1)); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

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
ORDER BY `ALL` DESC; -- { serverError UNKNOWN_TABLE }

SELECT (((1), (2)));

SELECT
    tupleElement((1 AS c0), 1),
    tupleElement((1 AS c0), 1); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT
    tuple(1 AS c0).1,
    tuple(1 AS c0).1;