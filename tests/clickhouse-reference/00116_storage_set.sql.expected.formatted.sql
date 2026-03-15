CREATE TABLE `set`
(
    x String
)
ENGINE = Set;

SELECT arrayJoin(['Hello', 'test', 'World', 'world', 'abc', 'xyz']) AS s
WHERE s IN (`set`);

SELECT arrayJoin(['Hello', 'test', 'World', 'world', 'abc', 'xyz']) AS s
WHERE s NOT IN (`set`);

SELECT arrayJoin(['Hello', 'test', 'World', 'world', 'abc', 'xyz']) AS s
WHERE s IN (set2);

CREATE TABLE tab
(
    x String
)
ENGINE = MergeTree
ORDER BY x AS
SELECT 'Hello';

SELECT *
FROM tab
PREWHERE x IN (`set`)
WHERE x IN (`set`)
LIMIT 1
SETTINGS enable_analyzer = 0;

SELECT *
FROM tab
PREWHERE x IN (`set`)
WHERE x IN (`set`)
LIMIT 1
SETTINGS enable_analyzer = 1;