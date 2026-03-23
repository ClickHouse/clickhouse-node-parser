CREATE TABLE source_table
(
    x UInt16
)
ENGINE = TinyLog;

INSERT INTO source_table SELECT *
FROM `system`.numbers
LIMIT 10;

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