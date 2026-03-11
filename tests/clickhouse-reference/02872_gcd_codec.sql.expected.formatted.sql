SELECT COUNT(*)
FROM (
        SELECT
            table_lz4.id,
            table_lz4.ui AS ui1,
            table_gcd.id,
            table_gcd.ui AS ui2
        FROM
            table_lz4
        INNER JOIN table_gcd
            ON table_lz4.id = table_gcd.id
    )
WHERE ui1 != ui2;

SELECT *
FROM table_gcd_codec_uint8;

SELECT *
FROM table_gcd_codec_uint16;

SELECT *
FROM table_gcd_codec_uint32;

SELECT *
FROM table_gcd_codec_uint64;

SELECT *
FROM table_gcd_codec_uint128;

SELECT *
FROM table_gcd_codec_uint256;

SELECT *
FROM table_gcd_codec_int8;

SELECT *
FROM table_gcd_codec_int16;

SELECT *
FROM table_gcd_codec_int32;

SELECT *
FROM table_gcd_codec_int64;

SELECT *
FROM table_gcd_codec_int128;

SELECT *
FROM table_gcd_codec_int256;

SELECT *
FROM table_gcd_codec_decimal32;

SELECT *
FROM table_gcd_codec_decimal64;

SELECT *
FROM table_gcd_codec_decimal128;

SELECT *
FROM table_gcd_codec_decimal256;

SELECT *
FROM table_gcd_codec_date;

SELECT *
FROM table_gcd_codec_date32;

SELECT *
FROM table_gcd_codec_datetime;

SELECT *
FROM table_gcd_codec_datetime64;

SELECT *
FROM table_gcd_codec_only_zeros;

SELECT *
FROM table_gcd_codec_one_hundred_zeros;

SELECT *
FROM table_gcd_codec_one_hundred_ones;