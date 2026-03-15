CREATE TABLE merge_tree_pk
(
    key UInt64,
    value String
)
ENGINE = ReplacingMergeTree()
PRIMARY KEY key;

SELECT *
FROM merge_tree_pk
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM merge_tree_pk FINAL
ORDER BY
    key ASC,
    value ASC;

CREATE TABLE merge_tree_pk_sql
(
    key UInt64,
    value String,
    PRIMARY KEY(key)
)
ENGINE = ReplacingMergeTree();

SELECT *
FROM merge_tree_pk_sql
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM merge_tree_pk_sql FINAL
ORDER BY
    key ASC,
    value ASC;

CREATE TABLE replicated_merge_tree_pk_sql
(
    key UInt64,
    value String,
    PRIMARY KEY(key)
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/01532_primary_key_without', 'r1');

SELECT *
FROM replicated_merge_tree_pk_sql
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM replicated_merge_tree_pk_sql FINAL
ORDER BY
    key ASC,
    value ASC;