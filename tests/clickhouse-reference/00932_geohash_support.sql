create table geohash_test_data (
	latitude  Float64,
	longitude Float64,
	encoded   String
) engine = MergeTree order by (latitude, longitude, encoded);
select geohashEncode(181.0, 91.0);
select geohashEncode(-181.0, -91.0);
select count(geohashDecode('abcdefghijklmnopqrstuvwxyz'));
select geohashEncode(-5.60302734375, 42.593994140625, 0);
select round(geohashDecode('ezs42').1, 5), round(geohashDecode('ezs42').2, 5);
select geohashEncode(-5.60302734375, 42.593994140625);
select geohashEncode(materialize(-5.60302734375), materialize(42.593994140625), 0);
select geohashEncode(materialize(-5.60302734375), materialize(42.593994140625), materialize(0));
select geohashEncode(-5.60302734375, materialize(42.593994140625), 0);
select geohashEncode(materialize(-5.60302734375), 42.593994140625, 0);
-- here results are strings, so reference may contain values to match for equality.
select 1 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 2 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 3 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 4 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 5 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 6 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 7 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 8 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 9 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 10 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 11 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select 12 as p, geohashEncode(longitude, latitude, p) as actual, if(actual = encoded, 'Ok', concat('expected: ', encoded)) from geohash_test_data WHERE length(encoded) = p order by all;
select
	geohashDecode(encoded) as actual,
	'expected:', encoded, '=>', latitude, longitude,
	'length:', 	length(encoded),
	'max lat error:', 180 / power(2, 2.5 * length(encoded)) as latitude_max_error,
	'max lon error:', 360 / power(2, 2.5 * length(encoded)) as longitude_max_error,
	'err:', (actual.2 - latitude) as lat_error, (actual.1 - longitude) as lon_error,
	'derr:', abs(lat_error) - latitude_max_error, abs(lon_error) - longitude_max_error
from geohash_test_data
where
	abs(lat_error) > latitude_max_error
	or
	abs(lon_error) > longitude_max_error;
