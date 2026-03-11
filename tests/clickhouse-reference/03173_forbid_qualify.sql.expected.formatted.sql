SELECT count()
FROM test_qualify;

SELECT *
FROM test_qualify
QUALIFY row_number() OVER (ORDER BY number ASC) = 50
SETTINGS enable_analyzer = 1;

SELECT *
FROM test_qualify
QUALIFY row_number() OVER (ORDER BY number ASC) = 50
SETTINGS enable_analyzer = 0;