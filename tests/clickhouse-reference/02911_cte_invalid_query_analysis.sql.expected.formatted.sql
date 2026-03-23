SYSTEM drop  table if exists t0;

SYSTEM drop  table if exists t1;

SYSTEM drop  table if exists t3;

CREATE TABLE t0
(
    pkey UInt32,
    c1 UInt32,
    PRIMARY KEY(pkey)
)
ENGINE = MergeTree;

CREATE TABLE t1
(
    vkey UInt32,
    PRIMARY KEY(vkey)
)
ENGINE = MergeTree;

CREATE TABLE t3
(
    c17 String,
    PRIMARY KEY(c17)
)
ENGINE = MergeTree;

INSERT INTO t1;

SYSTEM drop  table t0;

SYSTEM drop  table t1;

SYSTEM drop  table t3;