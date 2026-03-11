SELECT CAST(toLowCardinality(val) AS UInt64)
FROM (
        SELECT arrayJoin(['1']) AS val
    );

SELECT toUInt64(toLowCardinality(val))
FROM (
        SELECT arrayJoin(['1']) AS val
    );

SELECT 1 % toLowCardinality(val)
FROM (
        SELECT arrayJoin([1]) AS val
    );

SELECT gcd(1, toLowCardinality(val))
FROM (
        SELECT arrayJoin([1]) AS val
    );