-- this part worked successfully
SELECT * FROM (
select udf_type_of_int(1) union all
select udf_type_of_int(2)
) ORDER BY ALL;
-- ... and this not!
select udf_type_of_int(number) from numbers(5) order by number;
select number as id, udf_type_of_int(id) from numbers(5) order by number;
select number as id, udf_type_of_int(id or id = 1) from numbers(5) order by number;
