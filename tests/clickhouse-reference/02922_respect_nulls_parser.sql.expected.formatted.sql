SELECT formatQuery('SELECT first_value(number) RESPECT NULLS from numbers(1)');

SELECT formatQuery('SELECT first_value(number) IGNORE NULLS from numbers(1)');

SELECT formatQuery('SELECT any (number) RESPECT NULLS from numbers(1)');

SELECT formatQuery('SELECT LAST_VALUE(number) RESPECT NULLS from numbers(1)');

SELECT formatQuery('SELECT sum(number) RESPECT NULLS from numbers(1)');

SELECT toDateTimeNonExistingFunction(now()) AS b;

SELECT toDateTime(now()) AS b;

SELECT count()
FROM numbers(10)
WHERE in(number, (0));

SELECT if(number > 0, number, 0)
FROM numbers(0);

SELECT *
FROM `system`.one
WHERE indexHint(dummy = 1);

SELECT arrayJoin([[3,4,5], [6,7], [2], [1,1]]);

SELECT
    number,
    grouping(number % 2, number) AS gr
FROM numbers(10)
GROUP BY GROUPING SETS ((number), (number % 2))
SETTINGS force_grouping_standard_compatibility = 0;