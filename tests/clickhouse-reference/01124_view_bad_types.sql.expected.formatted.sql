CREATE TABLE source_table
(
    x UInt16
)
ENGINE = TinyLog;

CREATE VIEW dest_view (x UInt64)
AS
SELECT *
FROM source_table;

SELECT
    x,
    any(x)
FROM dest_view
GROUP BY x
ORDER BY x ASC;