SELECT *
FROM test_new_json_type FINAL
WHERE isNotNull(data.foo2)
ORDER BY id ASC;

SELECT *
FROM test_new_json_type FINAL
PREWHERE isNotNull(data.foo2)
WHERE isNotNull(data.foo2)
ORDER BY id ASC;