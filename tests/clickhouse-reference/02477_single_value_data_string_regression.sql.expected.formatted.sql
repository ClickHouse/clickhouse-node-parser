SELECT (
        SELECT hex(argMaxState('0123456789', number))
        FROM numbers(1)
    ) = state
FROM argmaxstate_hex_small
WHERE v = '22.8.5.29';

SELECT
    v,
    length(finalizeAggregation(CAST(unhex(state) AS AggregateFunction(argMax, String, UInt64))))
FROM argmaxstate_hex_small;

SELECT (
        SELECT hex(argMaxState('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', number))
        FROM numbers(1)
    ) = state
FROM argmaxstate_hex_large
WHERE v = '22.8.5.29';

SELECT
    v,
    length(finalizeAggregation(CAST(unhex(state) AS AggregateFunction(argMax, String, UInt64))))
FROM argmaxstate_hex_large;

SELECT (
        SELECT hex(argMaxState('', number))
        FROM numbers(1)
    ) = state
FROM argmaxstate_hex_empty
WHERE v = '22.8.5.29';

SELECT
    v,
    length(finalizeAggregation(CAST(unhex(state) AS AggregateFunction(argMax, String, UInt64))))
FROM argmaxstate_hex_empty;

SELECT
    '46_OK',
    finalizeAggregation(CAST(unhex('2F0000003031323334353637383930313233343536373839303132333435363738393031323334353637383930313233343500010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '46_KO',
    finalizeAggregation(CAST(unhex('2E00000030313233343536373839303132333435363738393031323334353637383930313233343536373839303132333435010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '47_OK',
    finalizeAggregation(CAST(unhex('30000000303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353600010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '47_KO',
    finalizeAggregation(CAST(unhex('2F0000003031323334353637383930313233343536373839303132333435363738393031323334353637383930313233343536010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '48_OK',
    finalizeAggregation(CAST(unhex('3100000030313233343536373839303132333435363738393031323334353637383930313233343536373839303132333435363700010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '48_KO',
    finalizeAggregation(CAST(unhex('30000000303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353637010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '63_OK',
    finalizeAggregation(CAST(unhex('4000000030313233343536373839303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353637383930313200010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '63_KO',
    finalizeAggregation(CAST(unhex('3F000000303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353637383930313233343536373839303132010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '64_OK',
    finalizeAggregation(CAST(unhex('410000003031323334353637383930313233343536373839303132333435363738393031323334353637383930313233343536373839303132333435363738393031323300010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '64_KO',
    finalizeAggregation(CAST(unhex('4000000030313233343536373839303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353637383930313233010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    '-1',
    maxMerge(x),
    length(maxMerge(x))
FROM (
        SELECT CAST(concat(unhex('ffffffff'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '-2',
    maxMerge(x),
    length(maxMerge(x))
FROM (
        SELECT CAST(concat(unhex('fffffffe'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '-2^31',
    maxMerge(x),
    length(maxMerge(x))
FROM (
        SELECT CAST(concat(unhex('00000080'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '2^31-1',
    maxMerge(x)
FROM (
        SELECT CAST(concat(unhex('ffffff7f'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '2^31-2',
    maxMerge(x)
FROM (
        SELECT CAST(concat(unhex('feffff7f'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '2^30',
    maxMerge(x)
FROM (
        SELECT CAST(concat(unhex('00000040'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '2^30+1',
    maxMerge(x)
FROM (
        SELECT CAST(concat(unhex('01000040'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '2^30-1',
    maxMerge(x)
FROM (
        SELECT CAST(concat(unhex('ffffff3f'), randomString(100500)), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '1M without 0',
    length(maxMerge(x))
FROM (
        SELECT CAST(concat(unhex('00001000'), randomString(0x00100000 - 1), 'x'), 'AggregateFunction(max, String)') AS x
    );

SELECT
    '1M with 0',
    length(maxMerge(x))
FROM (
        SELECT CAST(concat(unhex('00001000'), randomString(0x00100000 - 1), '\0'), 'AggregateFunction(max, String)') AS x
    );

SELECT
    'fuzz1',
    finalizeAggregation(CAST(unhex('3000000\0303132333435363738393031323334353637383930313233343536373839303132333435363738393031323334353600010000000000000000'), 'AggregateFunction(argMax, String, UInt64)'));

SELECT
    'fuzz2',
    finalizeAggregation(CAST(unhex(concat('04000000', '30313233', '01', 'ffffffffffffffff')), 'AggregateFunction(argMax, String, UInt64)')) AS x,
    length(x);

SELECT
    'fuzz3',
    finalizeAggregation(CAST(unhex(concat('04000000', '30313233', '00', 'ffffffffffffffff')), 'AggregateFunction(argMax, String, UInt64)')) AS x,
    length(x);

SELECT
    'fuzz4',
    finalizeAggregation(CAST(unhex(concat('04000000', '30313233', '00')), 'AggregateFunction(argMax, String, UInt64)')) AS x,
    length(x);

SELECT
    'fuzz5',
    finalizeAggregation(CAST(unhex('0100000000000000000FFFFFFFF0'), 'AggregateFunction(argMax, UInt64, String)'));

SELECT
    n,
    maxMerge(s) AS x,
    length(x)
FROM aggr
GROUP BY n
ORDER BY n ASC;

SELECT
    maxMerge(s) AS x,
    length(x)
FROM aggr;