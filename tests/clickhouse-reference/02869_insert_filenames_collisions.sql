SELECT lower(hex(reverse(CAST(sipHash128('very_very_long_column_name_that_will_be_replaced_with_hash'), 'FixedString(16)'))));
CREATE TABLE t_collisions
(
    `very_very_long_column_name_that_will_be_replaced_with_hash` Int32,
    `e798545eefc8b7a1c2c81ff00c064ad8` Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replace_long_file_name_to_hash = 1, max_file_name_length = 42; -- { serverError BAD_ARGUMENTS }
CREATE TABLE t_collisions
(
    `col1` Int32,
    `e798545eefc8b7a1c2c81ff00c064ad8` Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replace_long_file_name_to_hash = 1, max_file_name_length = 42;
CREATE TABLE t_collisions
(
    `very_very_long_column_name_that_will_be_replaced_with_hash` Int32,
    `e798545eefc8b7a1c2c81ff00c064ad8` Int32
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS replace_long_file_name_to_hash = 0;
INSERT INTO t_collisions VALUES (1, 1);
INSERT INTO t_collisions VALUES (2, 2);
SELECT * FROM t_collisions ORDER BY e798545eefc8b7a1c2c81ff00c064ad8;
CREATE TABLE t_collisions
(
    `id` Int,
    `col` Array(String),
    `col.s` Array(LowCardinality(String)),
    `col.u` Array(LowCardinality(String))
)
ENGINE = MergeTree
ORDER BY id; -- { serverError BAD_ARGUMENTS }
CREATE TABLE t_collisions
(
    `id` Int,
    `col` String,
    `col.s` Array(LowCardinality(String)),
    `col.u` Array(LowCardinality(String))
)
ENGINE = MergeTree
ORDER BY id;
