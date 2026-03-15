-- Tags: no-fasttest
SET input_format_defaults_for_omitted_fields = 1;

CREATE TABLE defaults
(
    x UInt32,
    y UInt32,
    a DEFAULT x + y,
    b Float32 DEFAULT round(log(1 + x + y), 5),
    c UInt32 DEFAULT 42,
    e MATERIALIZED x + y,
    f ALIAS x + y
)
ENGINE = MergeTree
ORDER BY x;

SELECT *
FROM defaults
ORDER BY (x, y) ASC;

SELECT *
FROM defaults
WHERE x = 7
FORMAT JSONEachRow;

SELECT *
FROM defaults
WHERE x > 7
ORDER BY x ASC
FORMAT JSONEachRow;