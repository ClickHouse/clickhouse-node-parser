CREATE TABLE t0
(
    c0 Int
)
ENGINE = SummingMergeTree()
ORDER BY (c0 DESC)
PRIMARY KEY c0
SETTINGS allow_experimental_reverse_key = 1;

INSERT INTO t0 (c0);

SELECT sum(c0)
FROM t0 FINAL;

CREATE TABLE t0
(
    c0 Int,
    c1 Int
)
ENGINE = SummingMergeTree()
ORDER BY (c0 DESC, c1)
PRIMARY KEY c0
SETTINGS allow_experimental_reverse_key = 1;

CREATE TABLE t0
(
    c0 Int,
    c1 Int
)
ENGINE = SummingMergeTree()
ORDER BY (c0 DESC, c1)
SETTINGS allow_experimental_reverse_key = 1;