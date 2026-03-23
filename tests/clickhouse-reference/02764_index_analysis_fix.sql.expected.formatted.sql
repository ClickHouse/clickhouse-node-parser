SYSTEM drop  table if exists x;

CREATE TABLE x
(
    dt String
)
ENGINE = MergeTree
ORDER BY tuple()
PARTITION BY toYYYYMM(toDate(dt));

INSERT INTO x;

SELECT *
FROM x
WHERE like(dt, '2022-10-01%');

SYSTEM drop  table x;