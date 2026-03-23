SYSTEM drop  table if exists t;

SYSTEM drop  table if exists mv;

CREATE TABLE t
ENGINE = Memory
EMPTY AS
SELECT 1;

SELECT count()
FROM t;

CREATE MATERIALIZED VIEW mv
ENGINE = Memory
EMPTY
AS
SELECT 1;

SELECT count()
FROM mv;

SYSTEM drop  table t;

SYSTEM drop  table mv;