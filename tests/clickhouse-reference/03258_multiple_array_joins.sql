SET enable_analyzer = 1;
CREATE TABLE test_multiple_array_join (
    id UInt64,
    person Nested (
        name String,
        surname String
    ),
    properties Nested (
        key String,
        value String
    )
) Engine=MergeTree ORDER BY id;
SELECT *
FROM test_multiple_array_join
ARRAY JOIN person
ARRAY JOIN properties
ORDER BY ALL;
