SELECT count()
FROM test
WHERE s = 'a'
    AND isNull(json.a);