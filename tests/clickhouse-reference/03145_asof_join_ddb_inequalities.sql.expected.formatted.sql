SET enable_analyzer = 1;

SET join_algorithm = 'full_sorting_merge';

SET date_time_input_format = 'basic';

CREATE TABLE events0
(
    begin Nullable(DateTime('UTC')),
    value Int32
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE probe0
(
    begin Nullable(DateTime('UTC'))
)
ENGINE = MergeTree
ORDER BY tuple();

SET join_use_nulls = 1;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin > e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin > e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin <= e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin <= e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
INNER JOIN events0 AS e
    ON p.begin < e.begin
ORDER BY p.begin ASC;

SELECT
    p.begin,
    e.begin,
    e.value
FROM
    probe0 AS p
LEFT JOIN events0 AS e
    ON p.begin < e.begin
ORDER BY p.begin ASC;