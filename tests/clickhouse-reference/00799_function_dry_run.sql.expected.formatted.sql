-- https://stackoverflow.com/questions/53416531/clickhouse-moving-average
DROP TABLE IF EXISTS bm;

CREATE TABLE bm
(
    amount float,
    business_dttm DateTime
)
ENGINE = Log;

INSERT INTO bm;

DROP TABLE bm;