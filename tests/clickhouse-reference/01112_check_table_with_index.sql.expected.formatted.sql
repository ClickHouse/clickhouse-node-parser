SET check_query_single_value_result = 'false';

CREATE TABLE check_table_with_indices
(
    id UInt64,
    data String,
    INDEX a id TYPE minmax GRANULARITY 3
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO check_table_with_indices;