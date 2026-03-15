SET send_logs_level = 'fatal';
CREATE TABLE Issue_2231_Invalid_Nested_Columns_Size (
    Date Date,
    NestedColumn Nested(
        ID    Int32,
        Count Int64
    )
) Engine = MergeTree 
    PARTITION BY tuple()
    ORDER BY Date;
SELECT * FROM Issue_2231_Invalid_Nested_Columns_Size;
