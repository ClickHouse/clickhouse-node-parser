SET allow_deprecated_syntax_for_merge_tree = 1;

SET max_threads = 1;

SET max_insert_threads = 1;

CREATE TABLE test_ins_arr
(
    date Date,
    val Array(UInt64)
)
ENGINE = MergeTree(date, (date), 8192);

SELECT *
FROM test_ins_arr
LIMIT 10;

CREATE TABLE test_ins_null
(
    date Date,
    val Nullable(UInt64)
)
ENGINE = MergeTree(date, (date), 8192);

SELECT *
FROM test_ins_null
LIMIT 10;

CREATE TABLE test_ins_arr_null
(
    date Date,
    val Array(Nullable(UInt64))
)
ENGINE = MergeTree(date, (date), 8192);

SELECT *
FROM test_ins_arr_null
LIMIT 10;

CREATE TABLE test_ins_arr_arr
(
    date Date,
    val Array(Array(UInt64))
)
ENGINE = MergeTree(date, (date), 8192);

SELECT *
FROM test_ins_arr_arr
LIMIT 10;

CREATE TABLE test_ins_arr_arr_null
(
    date Date,
    val Array(Array(Nullable(UInt64)))
)
ENGINE = MergeTree(date, (date), 8192);

SELECT *
FROM test_ins_arr_arr_null
LIMIT 10;

CREATE TABLE test_ins_arr_arr_arr
(
    date Date,
    val Array(Array(Array(UInt64)))
)
ENGINE = MergeTree(date, (date), 8192);

SELECT *
FROM test_ins_arr_arr_arr
LIMIT 10;