-- Tags: stateful
SELECT `ParsedParams.Key2` AS x
FROM
    test.hits
ARRAY JOIN ParsedParams AS PP
ORDER BY x ASC
LIMIT 2;

SELECT arrayJoin(`ParsedParams.Key2`) AS x
FROM test.hits
ORDER BY x ASC
LIMIT 2;