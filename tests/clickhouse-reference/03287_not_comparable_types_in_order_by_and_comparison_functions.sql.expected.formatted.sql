SELECT *
FROM test
ORDER BY agg1 ASC; -- {serverError ILLEGAL_COLUMN}

SELECT agg1 < agg2
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT agg1 <= agg2
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT agg1 > agg2
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT agg1 >= agg2
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT agg1 = agg2
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}

SELECT agg1 != agg2
FROM test; -- {serverError ILLEGAL_TYPE_OF_ARGUMENT}