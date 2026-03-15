SET allow_deprecated_error_prone_window_functions = 1;
CREATE TABLE largestTriangleThreeBucketsTestFloat64Float64
(
    x Float64,
    y Float64
) ENGINE = MergeTree order by (y,x);
select largestTriangleThreeBuckets(0)(x, y) FROM largestTriangleThreeBucketsTestFloat64Float64;
select largestTriangleThreeBuckets(1)(x, y) FROM largestTriangleThreeBucketsTestFloat64Float64;
select largestTriangleThreeBuckets(2)(x, y) FROM largestTriangleThreeBucketsTestFloat64Float64;
SELECT largestTriangleThreeBuckets(4)(x, y) AS downsampled_data
FROM largestTriangleThreeBucketsTestFloat64Float64;
CREATE TABLE largestTriangleThreeBucketsTestDecimal64Decimal64
(
    x Decimal64(2),
    y Decimal64(2)
) ENGINE = MergeTree order by (y,x);
select largestTriangleThreeBuckets(20)(x, y) from largestTriangleThreeBucketsTestDecimal64Decimal64;
create table largestTriangleThreeBucketsTestDateTime64Float64 (x DateTime64(3), y Float64) engine = MergeTree order by (y,x);
select largestTriangleThreeBuckets(5)(x, y) from largestTriangleThreeBucketsTestDateTime64Float64;
select lttb(5)(x, y) from largestTriangleThreeBucketsTestDateTime64Float64;
CREATE TABLE largestTriangleTreeBucketsBucketSizeTest
(
    x UInt32,
    y UInt32
) ENGINE = MergeTree ORDER BY x;
SELECT
  arrayJoin(lttb(1000)(x, y)) AS point,
  tupleElement(point, 1) AS point_x,
  point_x - neighbor(point_x, -1) AS point_x_diff_with_previous_row
FROM largestTriangleTreeBucketsBucketSizeTest LIMIT 990, 10;
SELECT largestTriangleThreeBuckets(1)(0, '1900-01-01 00:00:00'::DateTime64);
