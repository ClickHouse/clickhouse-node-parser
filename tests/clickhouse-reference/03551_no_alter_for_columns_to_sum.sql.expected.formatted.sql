DROP TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = SummingMergeTree((c0))
ORDER BY tuple();

DROP TABLE t0;