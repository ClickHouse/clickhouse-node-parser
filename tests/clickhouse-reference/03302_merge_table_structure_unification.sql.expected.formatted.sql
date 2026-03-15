SET enable_analyzer = 1;

CREATE TABLE test_a
(
    a UInt8,
    b String,
    c Array(String)
)
ENGINE = Memory;

CREATE TABLE test_b
(
    a Int32,
    c Array(Nullable(String)),
    d DateTime('UTC') DEFAULT now()
)
ENGINE = Memory;

CREATE TABLE test_merge
ENGINE = Merge(currentDatabase(), '^test_');

-- TODO: defaults are not calculated
SELECT *
FROM test_merge
ORDER BY a ASC;

SELECT '--- table function';

-- Note that this will also pick up the test_merge table, duplicating the results
SELECT *
FROM merge('^test_')
ORDER BY a ASC;

SET merge_table_max_tables_to_look_for_schema_inference = 1;