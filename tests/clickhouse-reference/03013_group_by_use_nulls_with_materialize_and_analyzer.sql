SELECT 3 + 3 from numbers(10) GROUP BY GROUPING SETS (('str'), (3 + 3)) order by all;
SELECT materialize(3) from numbers(10) GROUP BY GROUPING SETS (('str'), (materialize(3))) order by all;
SELECT ignore(3) from numbers(10) GROUP BY GROUPING SETS (('str'), (ignore(3))) order by all;
SELECT materialize(ignore(3)) from numbers(10) GROUP BY GROUPING SETS (('str'), (materialize(ignore(3)))) order by all;
SELECT ignore(materialize(3)) from numbers(10) GROUP BY GROUPING SETS (('str'), (ignore(materialize(3)))) order by all;
