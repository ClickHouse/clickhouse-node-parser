-- Tags: long, no-replicated-database
-- Tag no-replicated-database: Unsupported type of ALTER query
SET output_format_pretty_row_numbers = 0;

DROP TABLE IF EXISTS check_query_comment_column;

-- Check COMMENT COLUMN and MODIFY COLUMN statements with simple engine
CREATE TABLE check_query_comment_column
(
    first_column UInt8 DEFAULT 1 COMMENT 'comment 1',
    second_column UInt8 MATERIALIZED first_column COMMENT 'comment 2',
    third_column UInt8 ALIAS second_column COMMENT 'comment 3',
    fourth_column UInt8 COMMENT 'comment 4',
    fifth_column UInt8
)
ENGINE = TinyLog;

SELECT
    table,
    name,
    comment
FROM `system`.`columns`
WHERE table = 'check_query_comment_column'
    AND database = currentDatabase()
FORMAT PrettyCompactNoEscapes;

-- Check `ALTER TABLE table_name COMMENT COLUMN 'comment'` statement with MergeTree engine
CREATE TABLE check_query_comment_column
(
    first_column UInt8 COMMENT 'comment 1',
    second_column UInt8 COMMENT 'comment 2',
    third_column UInt8 COMMENT 'comment 3'
)
ENGINE = MergeTree()
ORDER BY first_column
PARTITION BY second_column
SAMPLE BY first_column;