CREATE TABLE IF NOT EXISTS dummy_table_03215
(
    id_col Nullable(String),
    date_col Date
)
ENGINE = MergeTree()
ORDER BY date_col;

INSERT INTO dummy_table_03215 (id_col, date_col);

SELECT 0 AS _row_exists
FROM dummy_table_03215
WHERE (date_col, id_col) IN (
        SELECT (date_col, id_col)
        FROM dummy_table_03215
    );

DROP TABLE IF EXISTS dummy_table_03215;