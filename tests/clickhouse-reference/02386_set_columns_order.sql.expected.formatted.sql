SYSTEM DROP  TABLE IF EXISTS userid_set;

SYSTEM DROP  TABLE IF EXISTS userid_test;

SYSTEM DROP  TABLE IF EXISTS userid_set2;

CREATE TABLE userid_set
(
    userid UInt64,
    name String
)
ENGINE = Set;

INSERT INTO userid_set;

CREATE TABLE userid_test
(
    userid UInt64,
    name String
)
ENGINE = MergeTree()
ORDER BY (userid)
PARTITION BY (intDiv(userid, 500))
SETTINGS index_granularity = 8192;

INSERT INTO userid_test;

SELECT *
FROM userid_test
WHERE (userid, name) IN (userid_set);

CREATE TABLE userid_set2
(
    userid UInt64,
    name String,
    birthdate Date
)
ENGINE = Set;

INSERT INTO userid_set2;

SYSTEM DROP  TABLE userid_set;

SYSTEM DROP  TABLE userid_test;

SYSTEM DROP  TABLE userid_set2;