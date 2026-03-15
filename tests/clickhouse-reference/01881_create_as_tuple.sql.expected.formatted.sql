CREATE TABLE t_create_as_tuple
ENGINE = MergeTree()
ORDER BY number AS
SELECT
    number,
    [('string',number)] AS `array`
FROM numbers(3);

SELECT *
FROM t_create_as_tuple
ORDER BY number ASC;