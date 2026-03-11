SELECT sum(project IN ('val1', 'val2'))
FROM test;

SELECT sum(project IN ('val1', 'val2'))
FROM test
WHERE project IN ('val1', 'val2');

SELECT count()
FROM test
WHERE project IN ('val1', 'val2');

SELECT project IN ('val1', 'val2')
FROM test
WHERE project IN ('val1', 'val2');