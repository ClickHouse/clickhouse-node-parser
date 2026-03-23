SYSTEM DROP  TABLE IF EXISTS mv;

SYSTEM DROP  TABLE IF EXISTS mv_source;

SYSTEM DROP  TABLE IF EXISTS mv_target;

CREATE TABLE mv_source
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE mv_target
(
    a UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE MATERIALIZED VIEW mv
TO mv_target
AS
SELECT *
FROM mv_source;

INSERT INTO mv_source;

INSERT INTO mv_source;

SELECT *
FROM mv
ORDER BY a ASC;

SELECT *
FROM mv_target
ORDER BY a ASC;

SYSTEM DROP  TABLE mv;

SYSTEM DROP  TABLE mv_source;

SYSTEM DROP  TABLE mv_target;