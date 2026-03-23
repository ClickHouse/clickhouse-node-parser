SYSTEM drop  table if exists with_nullable;

SYSTEM drop  table if exists without_nullable;

CREATE TABLE with_nullable
(
    timestamp UInt32,
    country LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE without_nullable
(
    timestamp UInt32,
    country LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO with_nullable;

INSERT INTO without_nullable;

SELECT if(isNull(t0.country), t2.country, t0.country) AS country
FROM
    without_nullable AS t0
RIGHT JOIN with_nullable AS t2
    ON t0.country = t2.country
ORDER BY 1 DESC;

SYSTEM drop  table with_nullable;

SYSTEM drop  table without_nullable;