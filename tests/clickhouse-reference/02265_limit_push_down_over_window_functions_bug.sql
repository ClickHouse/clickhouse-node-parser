SELECT
    number,
    leadInFrame(number) OVER w AS W
FROM numbers(10)
WINDOW w AS (ORDER BY number ASC Rows BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
LIMIT 3;
select * from (　( select *, count() over () cnt from　( select * from numbers(10000000) )　)　)  limit 3　;
select * from (　( select *, count() over () cnt from　( select * from numbers(10000000) )　)　) order by number limit 3　;
