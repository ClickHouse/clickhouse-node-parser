SELECT count()
FROM test_qualify; -- 100

SELECT *
FROM test_qualify
QUALIFY row_number() OVER (ORDER BY number ASC) = 50
SETTINGS enable_analyzer = 1; -- 49

SELECT *
FROM test_qualify
QUALIFY row_number() OVER (ORDER BY number ASC) = 50
SETTINGS enable_analyzer = 0; -- { serverError NOT_IMPLEMENTED }