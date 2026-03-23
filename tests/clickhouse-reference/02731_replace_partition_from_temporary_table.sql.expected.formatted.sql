CREATE TEMPORARY TABLE src
(
    p UInt64,
    k String,
    d UInt64
)
ENGINE = MergeTree
ORDER BY k
PARTITION BY p;

CREATE TABLE dst
(
    p UInt64,
    k String,
    d UInt64
)
ENGINE = MergeTree
ORDER BY k
PARTITION BY p;

CREATE TABLE rdst
(
    p UInt64,
    k String,
    d UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_alter_attach_00626_rdst', 'r1')
ORDER BY k
PARTITION BY p;

INSERT INTO src;

INSERT INTO src;

INSERT INTO src;

INSERT INTO src;

INSERT INTO src;

INSERT INTO src;

INSERT INTO dst;

INSERT INTO dst;

INSERT INTO dst;

INSERT INTO dst;

INSERT INTO rdst;

INSERT INTO rdst;

INSERT INTO rdst;

INSERT INTO rdst;

SELECT
    count(),
    sum(d)
FROM dst;

SELECT
    count(),
    sum(d)
FROM rdst;