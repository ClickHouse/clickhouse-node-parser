SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE test_a
(
    OldColumn String DEFAULT '',
    EventDate Date DEFAULT toDate(EventTime),
    EventTime DateTime
)
ENGINE = MergeTree(EventDate, EventTime, 8192);

CREATE TABLE test_b
(
    OldColumn String DEFAULT '',
    NewColumn String DEFAULT '',
    EventDate Date DEFAULT toDate(EventTime),
    EventTime DateTime
)
ENGINE = MergeTree(EventDate, EventTime, 8192);

SELECT NewColumn
FROM
    test_a
INNER JOIN (
        SELECT
            OldColumn,
            NewColumn
        FROM test_b
    ) AS s
    USING (OldColumn)
PREWHERE NewColumn != '';