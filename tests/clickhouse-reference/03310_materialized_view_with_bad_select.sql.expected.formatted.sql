SET allow_materialized_view_with_bad_select = 1;

SYSTEM DROP  TABLE IF EXISTS src;

SYSTEM DROP  TABLE IF EXISTS dst;

SYSTEM DROP  TABLE IF EXISTS mv;

CREATE TABLE src
(
    x int,
    y int
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE dst
(
    x int,
    z int
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE MATERIALIZED VIEW mv
TO dst
AS
SELECT
    x,
    y
FROM src;

INSERT INTO src;

SELECT *
FROM dst;

SET allow_materialized_view_with_bad_select = 0;

-- Insert into existing bad MV is still possible
INSERT INTO src;

SELECT *
FROM dst
ORDER BY `ALL` ASC;

-- Re-creating it is not
SYSTEM DROP  TABLE mv;

CREATE MATERIALIZED VIEW mv
TO nonexistent
AS
SELECT
    x,
    y
FROM src;

INSERT INTO src; -- { serverError UNKNOWN_TABLE }

SYSTEM DROP  TABLE src;

SYSTEM DROP  TABLE dst;