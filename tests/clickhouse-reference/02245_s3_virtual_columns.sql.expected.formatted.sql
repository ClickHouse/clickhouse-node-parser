SELECT *
FROM test_02245;

SELECT _path
FROM test_02245;

SELECT *
FROM test_02245_2;

SELECT
    _path,
    isNotNull(_etag)
FROM test_02245_2;

SELECT count()
FROM test_02245_2
WHERE _etag IN (
        SELECT _etag
        FROM test_02245_2
    );