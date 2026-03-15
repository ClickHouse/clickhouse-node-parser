CREATE TABLE userid_set
(
    userid UInt64,
    name String
)
ENGINE = Set;

CREATE TABLE userid_test
(
    userid UInt64,
    name String
)
ENGINE = MergeTree()
ORDER BY (userid)
PARTITION BY (intDiv(userid, 500))
SETTINGS index_granularity = 8192;

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