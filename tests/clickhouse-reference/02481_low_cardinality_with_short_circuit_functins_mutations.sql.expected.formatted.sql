SYSTEM drop  table if exists issue_46128;

CREATE TABLE issue_46128
(
    id Int64,
    a LowCardinality(Nullable(String)),
    b LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY id AS
SELECT
    number % 100,
    'xxxx',
    'yyyy'
FROM numbers(10);

SELECT *
FROM issue_46128
WHERE id <= 2
ORDER BY id ASC;

SYSTEM drop  table issue_46128;