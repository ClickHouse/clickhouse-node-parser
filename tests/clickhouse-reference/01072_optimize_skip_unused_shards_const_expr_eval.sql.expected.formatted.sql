SELECT *
FROM dist_01072
WHERE key = 0
    AND length(str) = 0;

SELECT *
FROM dist_01072
WHERE key = 0
    AND str = '';

SELECT *
FROM dist_01072
WHERE xxHash64(0) == xxHash64(0)
    AND key = 0;

SELECT *
FROM dist_01072
WHERE key = toInt32OrZero(toString(xxHash64(0)));

SELECT *
FROM dist_01072
WHERE key = toInt32(xxHash32(0));

SELECT *
FROM dist_01072
WHERE key = toInt32(toInt32(xxHash32(0)));

SELECT *
FROM dist_01072
WHERE key = toInt32(toInt32(toInt32(xxHash32(0))));

SELECT *
FROM dist_01072
WHERE key = value; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

SELECT *
FROM dist_01072
WHERE key = toInt32(value); -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

SELECT *
FROM dist_01072
WHERE key = value
SETTINGS force_optimize_skip_unused_shards = 0;

SELECT *
FROM dist_01072
WHERE key = toInt32(value)
SETTINGS force_optimize_skip_unused_shards = 0;

SELECT *
FROM dist_01072
WHERE key = 0
    AND _part = '0'
SETTINGS force_optimize_skip_unused_shards = 2;