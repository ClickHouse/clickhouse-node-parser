SYSTEM DROP  TABLE IF EXISTS ttl_table;

CREATE TABLE ttl_table
(
    EventDate Date,
    Longitude Float64 TTL EventDate + toIntervalWeek(2)
)
ENGINE = MergeTree()
ORDER BY EventDate
SETTINGS vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1;

INSERT INTO ttl_table;

SELECT *
FROM ttl_table;