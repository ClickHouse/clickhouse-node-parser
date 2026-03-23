-- Check CREATE TABLE
SYSTEM DROP  TABLE IF EXISTS tbl;

CREATE TABLE tbl
(
    id UInt32
)
ENGINE = MergeTree()
ORDER BY (id + 1, id + 1); -- { serverError BAD_ARGUMENTS }

CREATE TABLE tbl
(
    id UInt32
)
ENGINE = MergeTree()
ORDER BY (id + 1, id + 1)
SETTINGS allow_suspicious_indices = 1;

CREATE TABLE tbl
(
    id UInt32,
    INDEX idx tuple(id + 1, id + 1) TYPE minmax
)
ENGINE = MergeTree()
ORDER BY id; -- { serverError BAD_ARGUMENTS }

CREATE TABLE tbl
(
    id UInt32,
    INDEX idx tuple(id + 1, id + 1) TYPE minmax
)
ENGINE = MergeTree()
ORDER BY id
SETTINGS allow_suspicious_indices = 1;

CREATE TABLE tbl
(
    id1 UInt32
)
ENGINE = MergeTree()
ORDER BY id1;

CREATE TABLE tbl
(
    id UInt32
)
ENGINE = MergeTree()
ORDER BY id;