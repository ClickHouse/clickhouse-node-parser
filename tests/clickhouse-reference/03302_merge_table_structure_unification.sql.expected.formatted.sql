SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS test_a;

SYSTEM DROP  TABLE IF EXISTS test_b;

SYSTEM DROP  TABLE IF EXISTS test_merge;

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

INSERT INTO test_a;

INSERT INTO test_b;

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

SYSTEM DROP  TABLE test_merge;

SET merge_table_max_tables_to_look_for_schema_inference = 1;

SYSTEM DROP  TABLE test_a;

SYSTEM DROP  TABLE test_b;