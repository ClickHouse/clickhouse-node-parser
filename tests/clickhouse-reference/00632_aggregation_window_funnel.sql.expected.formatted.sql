SELECT 1 = windowFunnel(10000)(timestamp, event = 1000)
FROM funnel_test;

SELECT 2 = windowFunnel(10000)(timestamp, event = 1000, event = 1001)
FROM funnel_test;

SELECT 3 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002)
FROM funnel_test;

SELECT 4 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002, event = 1008)
FROM funnel_test;

SELECT 1 = windowFunnel(1)(timestamp, event = 1000)
FROM funnel_test;

SELECT 3 = windowFunnel(2)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007)
FROM funnel_test;

SELECT 4 = windowFunnel(3)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007)
FROM funnel_test;

SELECT 5 = windowFunnel(4)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007)
FROM funnel_test;

SELECT 5 = windowFunnel(4)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007)
FROM funnel_test2;

SELECT 2 = windowFunnel(10000)(timestamp, event = 1001, event = 1008)
FROM funnel_test2;

SELECT 1 = windowFunnel(10000)(timestamp, event = 1008, event = 1001)
FROM funnel_test2;

SELECT 4 = windowFunnel(4)(timestamp, event <= 1007, event >= 1002, event <= 1006, event >= 1004)
FROM funnel_test2;

SELECT 5 = windowFunnel(4)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007)
FROM funnel_test_u64;

SELECT 2 = windowFunnel(10000)(timestamp, event = 1001, event = 1008)
FROM funnel_test_u64;

SELECT 1 = windowFunnel(10000)(timestamp, event = 1008, event = 1001)
FROM funnel_test_u64;

SELECT 4 = windowFunnel(4)(timestamp, event <= 1007, event >= 1002, event <= 1006, event >= 1004)
FROM funnel_test_u64;

SELECT 6 = windowFunnel(10000, 'strict_deduplication')(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004, event = 1005, event = 1006)
FROM funnel_test_strict;

SELECT 7 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004, event = 1005, event = 1006)
FROM funnel_test_strict;

SELECT
    user,
    windowFunnel(86400)(dt, event = 'a', event = 'b', event = 'c') AS s
FROM funnel_test_strict_order
GROUP BY user
ORDER BY user ASC
FORMAT JSONCompactEachRow;

SELECT
    user,
    windowFunnel(86400, 'strict_order')(dt, event = 'a', event = 'b', event = 'c') AS s
FROM funnel_test_strict_order
GROUP BY user
ORDER BY user ASC
FORMAT JSONCompactEachRow;

SELECT
    user,
    windowFunnel(86400, 'strict_deduplication', 'strict_order')(dt, event = 'a', event = 'b', event = 'c') AS s
FROM funnel_test_strict_order
GROUP BY user
ORDER BY user ASC
FORMAT JSONCompactEachRow;

SELECT
    user,
    windowFunnel(10, 'strict_order')(dt, event = 'a', event = 'b', event = 'c') AS s
FROM funnel_test_strict_order
WHERE user = 7
GROUP BY user
FORMAT JSONCompactEachRow;

SELECT 3 = windowFunnel(86400, 'strict_deduplication')(ts, event = 'a', event = 'b', event = 'c', event = 'd')
FROM strict_BiteTheDDDD
FORMAT JSONCompactEachRow;

SELECT
    u,
    windowFunnel(86400)(dt, COALESCE(a, '') = 'a1', COALESCE(a, '') = 'a2') AS s
FROM funnel_test_non_null
GROUP BY u
ORDER BY u ASC
FORMAT JSONCompactEachRow;

SELECT
    u,
    windowFunnel(86400)(dt, COALESCE(a, '') = 'a1', COALESCE(b, '') = 'b2') AS s
FROM funnel_test_non_null
GROUP BY u
ORDER BY u ASC
FORMAT JSONCompactEachRow;

SELECT
    u,
    windowFunnel(86400)(dt, isNull(a)
    AND isNull(b)) AS s
FROM funnel_test_non_null
GROUP BY u
ORDER BY u ASC
FORMAT JSONCompactEachRow;

SELECT
    u,
    windowFunnel(86400)(dt, isNull(a), COALESCE(b, '') = 'b3') AS s
FROM funnel_test_non_null
GROUP BY u
ORDER BY u ASC
FORMAT JSONCompactEachRow;

SELECT
    u,
    windowFunnel(86400, 'strict_order')(dt, isNull(a), COALESCE(b, '') = 'b3') AS s
FROM funnel_test_non_null
GROUP BY u
ORDER BY u ASC
FORMAT JSONCompactEachRow;

SELECT 5 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004)
FROM funnel_test_strict_increase;

SELECT 2 = windowFunnel(10000, 'strict_increase')(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004)
FROM funnel_test_strict_increase;

SELECT 3 = windowFunnel(10000)(timestamp, event = 1004, event = 1004, event = 1004)
FROM funnel_test_strict_increase;

SELECT 1 = windowFunnel(10000, 'strict_once')(timestamp, event = 1004, event = 1004, event = 1004)
FROM funnel_test_strict_increase;

SELECT 1 = windowFunnel(10000, 'strict_increase')(timestamp, event = 1004, event = 1004, event = 1004)
FROM funnel_test_strict_increase;

SELECT
    uid,
    windowFunnel(200, 'strict_once', 'strict_increase')(toUInt32(event_ts), result = 'failure', result = 'failure', result = 'success')
FROM funnel_test2
WHERE event_ts >= 0
    AND event_ts <= 300
GROUP BY uid
ORDER BY uid ASC;

SELECT
    uid,
    windowFunnel(200, 'strict_once')(toUInt32(event_ts), result = 'failure', result = 'failure', result = 'success')
FROM funnel_test2
WHERE event_ts >= 0
    AND event_ts <= 300
GROUP BY uid
ORDER BY uid ASC;

SELECT
    uid,
    windowFunnel(200, 'strict_once', 'strict_deduplication')(toUInt32(event_ts), result = 'failure', result = 'failure', result = 'success')
FROM funnel_test2
WHERE event_ts >= 0
    AND event_ts <= 300
GROUP BY uid
ORDER BY uid ASC;

SELECT
    uid,
    windowFunnel(100, 'strict_order')(dt, event = 'a', event = 'b', event = 'a', event = 'c') AS res
FROM funnel_test_reentry
WHERE uid = 1
GROUP BY uid
FORMAT JSONCompactEachRow;

SELECT
    uid,
    windowFunnel(100, 'strict_order', 'allow_reentry')(dt, event = 'a', event = 'b', event = 'a', event = 'c') AS res
FROM funnel_test_reentry
WHERE uid = 1
GROUP BY uid
FORMAT JSONCompactEachRow;

SELECT
    uid,
    windowFunnel(100, 'strict_order')(dt, event = 'a', event = 'b', event = 'c') AS res
FROM funnel_test_reentry
WHERE uid = 2
GROUP BY uid
FORMAT JSONCompactEachRow;

SELECT
    uid,
    windowFunnel(100, 'strict_order', 'allow_reentry')(dt, event = 'a', event = 'b', event = 'c') AS res
FROM funnel_test_reentry
WHERE uid = 2
GROUP BY uid
FORMAT JSONCompactEachRow;

SELECT
    uid,
    windowFunnel(100, 'strict_order', 'allow_reentry')(dt, event = 'a', event = 'b', event = 'c') AS res
FROM funnel_test_reentry
WHERE uid = 3
GROUP BY uid
FORMAT JSONCompactEachRow;