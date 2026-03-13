SELECT formatQuery('SELECT first_value(number) RESPECT NULLS from numbers(1)');

SELECT formatQuery('SELECT first_value(number) IGNORE NULLS from numbers(1)');

SELECT formatQuery('SELECT any (number) RESPECT NULLS from numbers(1)');

SELECT formatQuery('SELECT LAST_VALUE(number) RESPECT NULLS from numbers(1)');

-- The parser doesn't know if this function supports "RESPECT/IGNORE" NULLS
SELECT formatQuery('SELECT sum(number) RESPECT NULLS from numbers(1)');

-- Normal functions should throw in the server
SELECT toDateTimeNonExistingFunction(now()) AS b; -- { serverError UNKNOWN_FUNCTION }

SELECT toDateTime(now()) AS b; -- { serverError SYNTAX_ERROR }

SELECT count()
FROM numbers(10)
WHERE in(number, (0)); -- { serverError SYNTAX_ERROR }

SELECT if(number > 0, number, 0)
FROM numbers(0); -- { serverError SYNTAX_ERROR }

SELECT *
FROM `system`.one
WHERE indexHint(dummy = 1); -- { serverError SYNTAX_ERROR }

SELECT arrayJoin([[3,4,5], [6,7], [2], [1,1]]); -- { serverError SYNTAX_ERROR }

SELECT
    number,
    grouping(number % 2, number) AS gr
FROM numbers(10)
GROUP BY GROUPING SETS ((number), (number % 2))
SETTINGS force_grouping_standard_compatibility = 0; -- { serverError SYNTAX_ERROR }