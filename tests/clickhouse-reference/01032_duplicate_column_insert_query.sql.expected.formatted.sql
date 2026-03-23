DROP TABLE IF EXISTS sometable;

CREATE TABLE sometable
(
    date Date,
    time Int64,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY time;

INSERT INTO sometable (date, time, value);

SELECT COUNT()
FROM sometable;

INSERT INTO sometable (date, time, value, time); -- {serverError DUPLICATE_COLUMN}