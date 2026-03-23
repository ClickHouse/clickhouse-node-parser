CREATE TABLE merge_tree_pk
(
    key UInt64,
    value String
)
ENGINE = ReplacingMergeTree()
PRIMARY KEY key;
INSERT INTO merge_tree_pk VALUES (1, 'a');
INSERT INTO merge_tree_pk VALUES (2, 'b');
SELECT * FROM merge_tree_pk ORDER BY key, value;
INSERT INTO merge_tree_pk VALUES (1, 'c');
SELECT * FROM merge_tree_pk FINAL ORDER BY key, value;
CREATE TABLE merge_tree_pk_sql
(
    key UInt64,
    value String,
    PRIMARY KEY (key)
)
ENGINE = ReplacingMergeTree();
INSERT INTO merge_tree_pk_sql VALUES (1, 'a');
INSERT INTO merge_tree_pk_sql VALUES (2, 'b');
SELECT * FROM merge_tree_pk_sql ORDER BY key, value;
INSERT INTO merge_tree_pk_sql VALUES (1, 'c');
SELECT * FROM merge_tree_pk_sql FINAL ORDER BY key, value;
INSERT INTO merge_tree_pk_sql VALUES (2, 'd', 555);
INSERT INTO merge_tree_pk_sql VALUES (2, 'e', 555);
CREATE TABLE replicated_merge_tree_pk_sql
(
    key UInt64,
    value String,
    PRIMARY KEY (key)
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/01532_primary_key_without', 'r1');
INSERT INTO replicated_merge_tree_pk_sql VALUES (1, 'a');
INSERT INTO replicated_merge_tree_pk_sql VALUES (2, 'b');
SELECT * FROM replicated_merge_tree_pk_sql ORDER BY key, value;
INSERT INTO replicated_merge_tree_pk_sql VALUES (1, 'c');
SELECT * FROM replicated_merge_tree_pk_sql FINAL ORDER BY key, value;
INSERT INTO replicated_merge_tree_pk_sql VALUES (2, 'd', 555);
INSERT INTO replicated_merge_tree_pk_sql VALUES (2, 'e', 555);
