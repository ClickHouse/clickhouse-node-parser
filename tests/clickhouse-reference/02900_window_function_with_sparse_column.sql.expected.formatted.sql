SELECT last_value(value) OVER (PARTITION BY id ORDER BY time ASC) AS last_value
FROM test1
WHERE (key = 3);

SELECT last_value(value) OVER (ORDER BY time ASC) AS last_value
FROM test1
WHERE (key = 3);

SELECT last_value(value) OVER (PARTITION BY id ORDER BY time ASC) AS last_value
FROM test1;

SELECT any(value) OVER (ORDER BY time ASC)
FROM test2;

SELECT last_value(value) OVER (ORDER BY time ASC)
FROM test2;