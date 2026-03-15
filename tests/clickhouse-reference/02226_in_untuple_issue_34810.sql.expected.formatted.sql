CREATE TABLE calendar
(
    year Int64,
    month Int64
)
ENGINE = TinyLog;

CREATE TABLE events32
(
    year Int32,
    month Int32
)
ENGINE = TinyLog;

SELECT *
FROM calendar
WHERE (year, month) IN (
        SELECT (year, month)
        FROM events32
    );