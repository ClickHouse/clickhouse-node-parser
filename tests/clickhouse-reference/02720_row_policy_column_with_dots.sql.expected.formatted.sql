CREATE TABLE IF NOT EXISTS table_with_dot_column
(
    date Date,
    regular_column String,
    `other_column.2` String
)
ENGINE = MergeTree()
ORDER BY date;

CREATE ROW POLICY IF NOT EXISTS row_policy ON table_with_dot_column USING toDate(date) >= today() - 30 TO ALL;

SELECT count(*)
FROM table_with_dot_column;