SELECT NULL AS t2value
FROM test1 t1
LEFT JOIN (
    SELECT id, t2value FROM test2
) t2
ON t1.id=t2.id
WHERE t2.t2value='test';
-- workaround should work too
SELECT NULL AS _svalue
FROM test1 t1
LEFT JOIN (
    SELECT id, t2value FROM test2
) t2
ON t1.id=t2.id
WHERE t2.t2value='test';
