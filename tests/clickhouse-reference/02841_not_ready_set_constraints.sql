CREATE TABLE t1 (
    `id` UInt64
)
ENGINE = MergeTree ORDER BY id;
CREATE TABLE t2 (
    `conversation` UInt64,
    CONSTRAINT constraint_conversation CHECK conversation IN (SELECT id FROM t1)
)
ENGINE = MergeTree ORDER BY conversation;
select * from t2;
