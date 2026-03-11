SELECT
    nan AS value,
    value = value,
    value = materialize(value),
    materialize(value) = value,
    materialize(value) = materialize(value);

SELECT
    cast(nan, 'Float32') AS value,
    value = value,
    value = materialize(value),
    materialize(value) = value,
    materialize(value) = materialize(value);

SELECT
    nan AS lhs,
    cast(nan, 'Float32') AS rhs,
    lhs = rhs,
    lhs = materialize(rhs),
    materialize(lhs) = rhs,
    materialize(lhs) = materialize(rhs);

SELECT '--';

SELECT value
FROM (
        SELECT stddevSamp(id) AS value
        FROM test_table
    ) AS subquery
WHERE ((value = value)
    AND (NOT value = value));

SELECT
    nan AS value,
    value != value,
    value != materialize(value),
    materialize(value) != value,
    materialize(value) != materialize(value);

SELECT
    cast(nan, 'Float32') AS value,
    value != value,
    value != materialize(value),
    materialize(value) != value,
    materialize(value) != materialize(value);

SELECT
    nan AS lhs,
    cast(nan, 'Float32') AS rhs,
    lhs != rhs,
    lhs != materialize(rhs),
    materialize(lhs) != rhs,
    materialize(lhs) != materialize(rhs);

SELECT value
FROM (
        SELECT (corr(value_1, value_1)) AS value
        FROM test_table
        WINDOW test_window AS (PARTITION BY value_2 ORDER BY id ASC)
    ) AS subquery
WHERE NOT NOT value <> value;

SELECT *
FROM
    (
        SELECT corr(id, id) AS corr_value
        FROM test_table
        GROUP BY value
    ) AS subquery
LEFT JOIN test_table
    ON (subquery.corr_value = test_table.id)
WHERE (test_table.id >= test_table.id)
    AND (NOT test_table.id >= test_table.id);