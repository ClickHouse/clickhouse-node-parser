SET send_logs_level = 'fatal';

CREATE TABLE Issue_2231_Invalid_Nested_Columns_Size
(
    Date Date,
    NestedColumn Nested(ID Int32, Count Int64)
)
ENGINE = MergeTree
ORDER BY Date
PARTITION BY tuple();

SELECT *
FROM Issue_2231_Invalid_Nested_Columns_Size;