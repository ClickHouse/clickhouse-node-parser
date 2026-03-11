-- corner case with constant sort prefix
SELECT number
FROM numbers(1)
ORDER BY 10 ASC, number DESC WITH FILL FROM 1
SETTINGS enable_positional_arguments=0;
-- FillingTransform: 6 rows will be processed in 1 chunks
select * from ts order by sensor_id, timestamp with fill step 1;
select * from ts order by sensor_id, timestamp with fill step 1 settings max_block_size=2;
select * from ts order by sensor_id, timestamp with fill step 1 settings max_block_size=3;
-- FROM and TO
-- ASC order in sorting prefix
select * from ts order by sensor_id, timestamp with fill from 6 to 10 step 1 interpolate (value as 9999);
select * from ts order by sensor_id, timestamp with fill from 6 to 10 step 1 interpolate (value as 9999) settings use_with_fill_by_sorting_prefix=0;
-- DESC order in sorting prefix
select * from ts order by sensor_id DESC, timestamp with fill from 6 to 10 step 1 interpolate (value as 9999);
select * from ts order by sensor_id DESC, timestamp with fill from 6 to 10 step 1 interpolate (value as 9999) settings use_with_fill_by_sorting_prefix=0;
-- without TO
-- ASC order in sorting prefix
select * from ts order by sensor_id, timestamp with fill from 6 step 1 interpolate (value as 9999);
select * from ts order by sensor_id, timestamp with fill from 6 step 1 interpolate (value as 9999) settings use_with_fill_by_sorting_prefix=0;
-- DESC order in sorting prefix
select * from ts order by sensor_id DESC, timestamp with fill from 6 step 1 interpolate (value as 9999);
select * from ts order by sensor_id DESC, timestamp with fill from 6 step 1 interpolate (value as 9999) settings use_with_fill_by_sorting_prefix=0;
-- without FROM
-- ASC order in sorting prefix
select * from ts order by sensor_id, timestamp with fill to 10 step 1 interpolate (value as 9999);
select * from ts order by sensor_id, timestamp with fill to 10 step 1 interpolate (value as 9999) settings use_with_fill_by_sorting_prefix=0;
-- DESC order in sorting prefix
select * from ts order by sensor_id DESC, timestamp with fill to 10 step 1 interpolate (value as 9999);
select * from ts order by sensor_id DESC, timestamp with fill to 10 step 1 interpolate (value as 9999) settings use_with_fill_by_sorting_prefix=0;
-- checking that sorting prefix columns can't be used in INTERPOLATE
SELECT * FROM ts ORDER BY sensor_id, value, timestamp WITH FILL FROM 6 TO 10 INTERPOLATE ( value AS 1 ); -- { serverError INVALID_WITH_FILL_EXPRESSION }
