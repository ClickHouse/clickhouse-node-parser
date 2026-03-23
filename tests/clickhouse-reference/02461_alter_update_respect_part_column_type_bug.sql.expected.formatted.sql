CREATE TABLE src
(
    A Int64,
    B String,
    C String
)
ENGINE = MergeTree
ORDER BY A
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO src;

SELECT *
FROM src;

CREATE TABLE src
(
    A String,
    B String,
    C String
)
ENGINE = MergeTree
ORDER BY A
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO src;

SELECT '-----';

CREATE TABLE src
(
    A Int64,
    B String,
    C String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/src1', '1')
ORDER BY A
SETTINGS min_bytes_for_wide_part = 0;

CREATE TABLE src
(
    A String,
    B String,
    C String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/src2', '1')
ORDER BY A
SETTINGS min_bytes_for_wide_part = 0;

CREATE TABLE src
(
    A String,
    B String,
    C String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/src3', '1')
ORDER BY A
SETTINGS min_bytes_for_wide_part = 0;

CREATE TABLE src
(
    A String,
    B String,
    C String
)
ENGINE = ReplicatedMergeTree('/clickhouse/{database}/test/src4', '1')
ORDER BY A
SETTINGS min_bytes_for_wide_part = 0;