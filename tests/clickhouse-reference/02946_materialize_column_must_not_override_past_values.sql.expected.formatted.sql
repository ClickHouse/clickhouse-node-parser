SET mutations_sync = 2;

SYSTEM DROP  TABLE IF EXISTS tab;

SELECT '-- Compact parts';

CREATE TABLE tab
(
    id Int64,
    dflt Int64 DEFAULT 54321
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO tab (id, dflt);

INSERT INTO tab (id);

SELECT *
FROM tab
ORDER BY id ASC;

SYSTEM DROP  TABLE tab;

CREATE TABLE tab
(
    id Int64,
    dflt Int64 DEFAULT 54321
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1;

CREATE TABLE tab
(
    id Int64,
    dflt Nullable(Int64) DEFAULT 54321
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1;

INSERT INTO tab (id, dflt);

INSERT INTO tab (id);

CREATE TABLE tab
(
    id Int64,
    mtrl Int64 MATERIALIZED 54321
)
ENGINE = MergeTree
ORDER BY id;

INSERT INTO tab (id);

SELECT
    id,
    mtrl
FROM tab
ORDER BY id ASC;

CREATE TABLE tab
(
    id Int64,
    mtrl Int64 MATERIALIZED 54321
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 1;