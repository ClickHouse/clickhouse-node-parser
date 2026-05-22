DROP TABLE IF EXISTS x;

CREATE TABLE x
ENGINE = MergeTree
ORDER BY tuple() AS
SELECT
    tuple() AS a,
    tuple() AS b;

INSERT INTO x;

SELECT count()
FROM x;

SELECT *
FROM x
ORDER BY tuple() ASC;

SELECT tuple();

SET allow_experimental_nullable_tuple_type = 0;

CREATE TABLE x
(
    i Nullable(Tuple())
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError ILLEGAL_COLUMN }

SET allow_experimental_nullable_tuple_type = 1;

SET allow_experimental_nullable_tuple_type = DEFAULT;

DROP TABLE x;

CREATE TABLE x
(
    i LowCardinality(Tuple())
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError 43 }

CREATE TABLE x
(
    i Tuple(),
    j Array(Tuple())
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO x;

SELECT *
FROM x
ORDER BY tuple() ASC
SETTINGS max_threads = 1;