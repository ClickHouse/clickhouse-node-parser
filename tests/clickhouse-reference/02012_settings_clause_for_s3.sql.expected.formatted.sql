CREATE TABLE table_with_range
(
    name String,
    number UInt32
)
ENGINE = S3('http://localhost:11111/test/tsv_with_header.tsv', 'test', 'testtest', 'TSVWithNames')
SETTINGS input_format_with_names_use_header = 1;

SELECT *
FROM table_with_range;