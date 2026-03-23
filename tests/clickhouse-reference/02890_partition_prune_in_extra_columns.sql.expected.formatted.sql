SYSTEM DROP  TABLE IF EXISTS e;

CREATE TABLE e
(
    dt DateTime,
    t Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (t, toYYYYMM(dt));

INSERT INTO e SELECT
    toDateTime('2022-12-12 11:00:00') + number,
    86
FROM numbers(10);

SELECT COUNT(*)
FROM e
WHERE (t, dt) IN (86, '2022-12-12 11:00:00');

SYSTEM DROP  TABLE e;