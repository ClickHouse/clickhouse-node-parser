SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE test_table
(
    id Float32,
    value Float32
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE test_table__fuzz_3
(
    id LowCardinality(Nullable(Float32)),
    value Float32
)
ENGINE = MergeTree
ORDER BY id
SETTINGS allow_nullable_key = 1;

SELECT *
FROM
    (
        SELECT
            CAST('104857.5', 'Float32'),
            corr(NULL, id, id) AS corr_value
        FROM test_table__fuzz_3
        GROUP BY value
    ) AS subquery
LEFT JOIN test_table
    ON subquery.corr_value = test_table.id
FORMAT Null;