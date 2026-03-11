SELECT largestTriangleThreeBuckets(0)(x, y)
FROM largestTriangleThreeBucketsTestFloat64Float64;

SELECT largestTriangleThreeBuckets(1)(x, y)
FROM largestTriangleThreeBucketsTestFloat64Float64;

SELECT largestTriangleThreeBuckets(2)(x, y)
FROM largestTriangleThreeBucketsTestFloat64Float64;

SELECT largestTriangleThreeBuckets(4)(x, y) AS downsampled_data
FROM largestTriangleThreeBucketsTestFloat64Float64;

SELECT largestTriangleThreeBuckets(20)(x, y)
FROM largestTriangleThreeBucketsTestDecimal64Decimal64;

SELECT largestTriangleThreeBuckets(5)(x, y)
FROM largestTriangleThreeBucketsTestDateTime64Float64;

SELECT lttb(5)(x, y)
FROM largestTriangleThreeBucketsTestDateTime64Float64;

SELECT
    arrayJoin(lttb(1000)(x, y)) AS point,
    point.1 AS point_x,
    point_x - neighbor(point_x, -1) AS point_x_diff_with_previous_row
FROM largestTriangleTreeBucketsBucketSizeTest
LIMIT 990, 10;

SELECT largestTriangleThreeBuckets(1)(0, '1900-01-01 00:00:00'::DateTime64);