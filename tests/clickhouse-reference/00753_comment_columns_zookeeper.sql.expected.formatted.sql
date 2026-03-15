CREATE TABLE check_comments
(
    column_name1 UInt8 DEFAULT 1 COMMENT 'comment',
    column_name2 UInt8 COMMENT 'non default comment'
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_00753/comments', 'r1')
ORDER BY column_name1;

SELECT *
FROM `system`.`columns`
WHERE table = 'check.comments'
    AND database = currentDatabase();