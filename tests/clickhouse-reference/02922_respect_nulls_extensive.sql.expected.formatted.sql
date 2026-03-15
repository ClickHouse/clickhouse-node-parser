-- { echoOn }
-- The function name is case insensitive, with or without respect nulls and using any of the aliases
SELECT
    number,
    first_value(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    FIRST_VALUE(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    first_value_respect_nulls(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    any(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    any_value(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    last_value(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    LAST_VALUE(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    last_value_respect_nulls(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    anyLast(number) OVER (ORDER BY number ASC)
FROM numbers(1);

-- IGNORE NULLS should be accepted too
SELECT
    number,
    FIRST_VALUE(number) OVER (ORDER BY number ASC)
FROM numbers(1);

SELECT
    number,
    LAST_VALUE(number) OVER (ORDER BY number ASC)
FROM numbers(1);

-- When applying IGNORE NULLs to first_value_respect_nulls we go back to the original function (any)
SELECT first_value_respect_nulls(number)
FROM (
        SELECT if(number < 2, NULL, number) AS number
        FROM numbers(10)
    );

SELECT last_value_respect_nulls(number)
FROM (
        SELECT if(number < 2, NULL, number) AS number
        FROM numbers(10)
    );

-- IGNORE/RESPECT NULLS should work with combinators because we can do it
SELECT first_valueIf(number, NOT isNull(number)
    AND (assumeNotNull(number) > 5))
FROM (
        SELECT if(number < 2, NULL, number) AS number
        FROM numbers(10)
    );

SELECT last_valueIf(number, NOT isNull(number)
    AND (assumeNotNull(number) > 5))
FROM (
        SELECT if(number < 2, NULL, number) AS number
        FROM numbers(10)
    );

SELECT first_valueIf(number, isNull(number))
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT last_valueIf(number, isNull(number))
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT toTypeName(first_valueIfState(number, isNull(number)))
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT toTypeName(last_valueIfState(number, isNull(number)))
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT anyIf(number, isNull(number))
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT anyLastIf(number, isNull(number))
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

-- Unsupported functions should throw in the server
SELECT
    number,
    sum(number) OVER (ORDER BY number ASC)
FROM numbers(1); -- { serverError NOT_IMPLEMENTED }

SELECT
    number,
    avgIf(number) OVER (ORDER BY number ASC)
FROM numbers(1); -- { serverError NOT_IMPLEMENTED }

-- Same for double RESPECT NULLS
SELECT
    number,
    first_value_respect_nulls(number) OVER (ORDER BY number ASC)
FROM numbers(1); -- { serverError NOT_IMPLEMENTED }

SELECT
    number,
    last_value_respect_nulls(number) OVER (ORDER BY number ASC)
FROM numbers(1); -- { serverError NOT_IMPLEMENTED }

-- Aggregate_functions_null_for_empty should work the same way
SELECT toTypeName(any(number))
FROM numbers(1);

SELECT toTypeName(anyOrNull(number))
FROM numbers(1);

SELECT any(number)
FROM numbers(0);

SELECT anyOrNull(number)
FROM numbers(0);

SELECT any(number)
FROM (
        SELECT NULL::Nullable(UInt8) AS number
        FROM numbers(10)
    );

SELECT anyOrNull(number)
FROM (
        SELECT NULL::Nullable(UInt8) AS number
        FROM numbers(10)
    );

SELECT any(number)
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT anyOrNull(number)
FROM (
        SELECT if(number > 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT any(number)
FROM (
        SELECT if(number < 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT anyOrNull(number)
FROM (
        SELECT if(number < 8, NULL, number) AS number
        FROM numbers(10)
    );

SELECT toTypeName(any(number))
FROM numbers(1)
SETTINGS aggregate_functions_null_for_empty = 1;

SELECT any(number)
FROM numbers(0)
SETTINGS aggregate_functions_null_for_empty = 1;