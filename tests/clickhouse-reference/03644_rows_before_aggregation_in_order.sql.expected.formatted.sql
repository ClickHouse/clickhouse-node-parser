SELECT i
FROM `03644_data`
GROUP BY i
HAVING count() > 1
SETTINGS
    rows_before_aggregation = 1,
    exact_rows_before_limit = 1,
    output_format_write_statistics = 0,
    max_block_size = 100,
    aggregation_in_order_max_block_bytes = 8,
    optimize_aggregation_in_order = 1
FORMAT JSONCompact;