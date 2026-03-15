CREATE TABLE t1
(
    id String,
    name String,
    value UInt32
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS join_use_nulls = 1;

CREATE TABLE t2
(
    id String,
    name String,
    value UInt32
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS join_use_nulls = 0;

CREATE TABLE t3
(
    id Nullable(String),
    name String,
    value UInt32
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS join_use_nulls = 1;

CREATE TABLE t4
(
    id String,
    name Nullable(String),
    value UInt32
)
ENGINE = Join(`ANY`, `LEFT`, id)
SETTINGS join_use_nulls = 0;

SELECT
    *,
    toTypeName(id),
    toTypeName(name)
FROM t1;

SELECT
    *,
    toTypeName(id),
    toTypeName(name)
FROM t2;

SELECT
    *,
    toTypeName(id),
    toTypeName(name)
FROM t3;

SELECT
    *,
    toTypeName(id),
    toTypeName(name)
FROM t4;

SET join_use_nulls = 1;