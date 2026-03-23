SYSTEM DROP  TABLE IF EXISTS logs;

CREATE TABLE logs
(
    date_visited DateTime,
    date Date MATERIALIZED toDate(date_visited)
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT count()
FROM logs AS plogs
WHERE plogs.date = '2019-11-20';

INSERT INTO logs;

SYSTEM DROP  TABLE logs;