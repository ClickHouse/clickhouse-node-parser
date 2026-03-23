CREATE TABLE rollup_having
(
    a Nullable(String),
    b Nullable(String)
)
ENGINE = Memory;

INSERT INTO rollup_having;

INSERT INTO rollup_having;

INSERT INTO rollup_having;

SELECT
    a,
    b,
    count(*) AS count
FROM rollup_having
GROUP BY
    a,
    b
WITH ROLLUP
HAVING isNotNull(a)
ORDER BY
    a ASC,
    b ASC,
    count ASC;

SELECT
    a,
    b,
    count(*) AS count
FROM rollup_having
GROUP BY
    a,
    b
WITH ROLLUP
HAVING isNotNull(a)
    AND isNotNull(b)
ORDER BY
    a ASC,
    b ASC,
    count ASC;