SELECT *
FROM test;

SELECT
    json.`a/b/c`,
    json.`a-b-c`,
    json.`a-b/c-d/e`
FROM test;

SELECT
    json.`a/b/c`.:Int64,
    json.`a-b-c`.:Int64,
    json.`a-b/c-d/e`.:Int64
FROM test;