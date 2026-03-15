SET enable_json_type = 1;

CREATE TABLE test
(
    agg1 AggregateFunction(sum, UInt64),
    agg2 AggregateFunction(sum, UInt64)
)
ENGINE = Memory;

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