SELECT COLUMNS(bar, foo) APPLY(length)
FROM test;

SELECT COLUMNS(bar, foo, xyz) APPLY(length)
FROM test;