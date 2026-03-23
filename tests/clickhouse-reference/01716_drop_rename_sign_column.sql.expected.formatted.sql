SYSTEM DROP  TABLE IF EXISTS signed_table;

CREATE TABLE signed_table
(
    k UInt32,
    v String,
    s Int8
)
ENGINE = CollapsingMergeTree(s)
ORDER BY k;

INSERT INTO signed_table (k, v, s);