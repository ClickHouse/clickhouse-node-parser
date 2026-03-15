-- Tags: replica
CREATE TABLE enum_alter_issue
(
    a Enum8('one' = 1, 'two' = 2)
)
ENGINE = MergeTree()
ORDER BY a;

SELECT *
FROM enum_alter_issue
ORDER BY a ASC;