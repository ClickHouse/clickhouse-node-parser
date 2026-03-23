-- Tags: zookeeper
DROP TABLE IF EXISTS merge_tree_pk;

CREATE TABLE merge_tree_pk
(
    key UInt64,
    value String
)
ENGINE = ReplacingMergeTree()
PRIMARY KEY key;

INSERT INTO merge_tree_pk;

INSERT INTO merge_tree_pk;

SELECT *
FROM merge_tree_pk
ORDER BY
    key ASC,
    value ASC;

INSERT INTO merge_tree_pk;

SELECT *
FROM merge_tree_pk FINAL
ORDER BY
    key ASC,
    value ASC;

DROP TABLE IF EXISTS merge_tree_pk_sql;

CREATE TABLE merge_tree_pk_sql
(
    key UInt64,
    value String,
    PRIMARY KEY(key)
)
ENGINE = ReplacingMergeTree();

INSERT INTO merge_tree_pk_sql;

INSERT INTO merge_tree_pk_sql;

SELECT *
FROM merge_tree_pk_sql
ORDER BY
    key ASC,
    value ASC;

INSERT INTO merge_tree_pk_sql;

SELECT *
FROM merge_tree_pk_sql FINAL
ORDER BY
    key ASC,
    value ASC;

INSERT INTO merge_tree_pk_sql;

INSERT INTO merge_tree_pk_sql;

DROP TABLE IF EXISTS replicated_merge_tree_pk_sql;

CREATE TABLE replicated_merge_tree_pk_sql
(
    key UInt64,
    value String,
    PRIMARY KEY(key)
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/01532_primary_key_without', 'r1');

INSERT INTO replicated_merge_tree_pk_sql;

INSERT INTO replicated_merge_tree_pk_sql;

SELECT *
FROM replicated_merge_tree_pk_sql
ORDER BY
    key ASC,
    value ASC;

INSERT INTO replicated_merge_tree_pk_sql;

SELECT *
FROM replicated_merge_tree_pk_sql FINAL
ORDER BY
    key ASC,
    value ASC;

INSERT INTO replicated_merge_tree_pk_sql;

INSERT INTO replicated_merge_tree_pk_sql;