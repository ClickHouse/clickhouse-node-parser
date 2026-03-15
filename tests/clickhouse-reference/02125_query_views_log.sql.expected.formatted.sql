SET output_format_pretty_single_large_number_tip_threshold = 0;

CREATE TABLE src
(
    key Int
)
ENGINE = Null();

CREATE TABLE dst
(
    key Int
)
ENGINE = Null();

CREATE MATERIALIZED VIEW mv1
TO dst
AS
SELECT *
FROM src;

CREATE MATERIALIZED VIEW mv2
TO dst
AS
SELECT *
FROM src;

-- { echo }
SELECT
    view_name,
    read_rows,
    read_bytes,
    written_rows,
    written_bytes
FROM `system`.query_views_log
WHERE startsWith(view_name, concat(currentDatabase(), '.mv'))
ORDER BY view_name ASC
FORMAT Vertical;

SELECT
    read_rows,
    read_bytes,
    written_rows,
    written_bytes
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND query_kind = 'Insert'
    AND current_database = currentDatabase()
FORMAT Vertical;