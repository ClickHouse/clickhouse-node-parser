SELECT grouping(num1), num1,
       any(num1), min(num1), max(num1), sum(num1), avg(num1), count(num1),
       any(num2), min(num2), max(num2), sum(num2), avg(num2), count(num2)
FROM (SELECT 10 AS num1, 20 AS num2)
GROUP BY GROUPING SETS ((num1), ())
ORDER BY grouping(num1) DESC;
select arrayStringConcat(groupArray('-')) from numbers(67);
-- Query A
select 
    uid, name
    ,sum(age)
    ,count()
    ,arrayUniq(groupArray(ts))
    ,max(age)
    ,max(ts)
from users
group by grouping sets 
(
    (*),
    ()
)
ORDER BY ALL;
-- Query B
select 
    uid, name
    ,sum(age)
    ,count()
    ,arrayUniq(groupArray(ts))
    ,max(age)
    ,max(ts)
from users
group by grouping sets 
(
    (uid, name),
    ()
)
ORDER BY ALL;
