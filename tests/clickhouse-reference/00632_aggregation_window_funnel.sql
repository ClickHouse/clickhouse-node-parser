select 1 = windowFunnel(10000)(timestamp, event = 1000) from funnel_test;
select 2 = windowFunnel(10000)(timestamp, event = 1000, event = 1001) from funnel_test;
select 3 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002) from funnel_test;
select 4 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002, event = 1008) from funnel_test;
select 1 = windowFunnel(1)(timestamp, event = 1000) from funnel_test;
select 3 = windowFunnel(2)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007) from funnel_test;
select 4 = windowFunnel(3)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007) from funnel_test;
select 5 = windowFunnel(4)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007) from funnel_test;
select 5 = windowFunnel(4)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007) from funnel_test2;
select 2 = windowFunnel(10000)(timestamp, event = 1001, event = 1008) from funnel_test2;
select 1 = windowFunnel(10000)(timestamp, event = 1008, event = 1001) from funnel_test2;
select 4 = windowFunnel(4)(timestamp, event <= 1007, event >= 1002, event <= 1006, event >= 1004) from funnel_test2;
select 5 = windowFunnel(4)(timestamp, event = 1003, event = 1004, event = 1005, event = 1006, event = 1007) from funnel_test_u64;
select 2 = windowFunnel(10000)(timestamp, event = 1001, event = 1008) from funnel_test_u64;
select 1 = windowFunnel(10000)(timestamp, event = 1008, event = 1001) from funnel_test_u64;
select 4 = windowFunnel(4)(timestamp, event <= 1007, event >= 1002, event <= 1006, event >= 1004) from funnel_test_u64;
select 6 = windowFunnel(10000, 'strict_deduplication')(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004, event = 1005, event = 1006) from funnel_test_strict;
select 7 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004, event = 1005, event = 1006) from funnel_test_strict;
select user, windowFunnel(86400)(dt, event='a', event='b', event='c') as s from funnel_test_strict_order group by user order by user format JSONCompactEachRow;
select user, windowFunnel(86400, 'strict_order')(dt, event='a', event='b', event='c') as s from funnel_test_strict_order group by user order by user format JSONCompactEachRow;
select user, windowFunnel(86400, 'strict_deduplication', 'strict_order')(dt, event='a', event='b', event='c') as s from funnel_test_strict_order group by user order by user format JSONCompactEachRow;
select user, windowFunnel(10, 'strict_order')(dt, event = 'a', event = 'b', event = 'c') as s from funnel_test_strict_order where user = 7 group by user format JSONCompactEachRow;
select 3 = windowFunnel(86400, 'strict_deduplication')(ts, event='a', event='b', event='c', event='d') from strict_BiteTheDDDD format JSONCompactEachRow;
select u, windowFunnel(86400)(dt, COALESCE(a, '') = 'a1', COALESCE(a, '') = 'a2') as s from funnel_test_non_null group by u order by u format JSONCompactEachRow;
select u, windowFunnel(86400)(dt, COALESCE(a, '') = 'a1', COALESCE(b, '') = 'b2') as s from funnel_test_non_null group by u order by u format JSONCompactEachRow;
select u, windowFunnel(86400)(dt, a is null and b is null) as s from funnel_test_non_null group by u order by u format JSONCompactEachRow;
select u, windowFunnel(86400)(dt, a is null, COALESCE(b, '') = 'b3') as s from funnel_test_non_null group by u order by u format JSONCompactEachRow;
select u, windowFunnel(86400, 'strict_order')(dt, a is null, COALESCE(b, '') = 'b3') as s from funnel_test_non_null group by u order by u format JSONCompactEachRow;
select 5 = windowFunnel(10000)(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004) from funnel_test_strict_increase;
select 2 = windowFunnel(10000, 'strict_increase')(timestamp, event = 1000, event = 1001, event = 1002, event = 1003, event = 1004) from funnel_test_strict_increase;
select 3 = windowFunnel(10000)(timestamp, event = 1004, event = 1004, event = 1004) from funnel_test_strict_increase;
select 1 = windowFunnel(10000, 'strict_once')(timestamp, event = 1004, event = 1004, event = 1004) from funnel_test_strict_increase;
select 1 = windowFunnel(10000, 'strict_increase')(timestamp, event = 1004, event = 1004, event = 1004) from funnel_test_strict_increase;
SELECT uid, windowFunnel(200, 'strict_once', 'strict_increase')( toUInt32(event_ts), result='failure', result='failure', result='success' )
FROM funnel_test2 WHERE event_ts >= 0 AND event_ts <= 300 GROUP BY uid ORDER BY uid;
SELECT uid, windowFunnel(200, 'strict_once')( toUInt32(event_ts), result='failure', result='failure', result='success' )
FROM funnel_test2 WHERE event_ts >= 0 AND event_ts <= 300 GROUP BY uid ORDER BY uid;
SELECT uid, windowFunnel(200, 'strict_once', 'strict_deduplication')( toUInt32(event_ts), result='failure', result='failure', result='success' )
FROM funnel_test2 WHERE event_ts >= 0 AND event_ts <= 300 GROUP BY uid ORDER BY uid;
select uid, windowFunnel(100, 'strict_order')(dt, event='a', event='b', event='a', event='c') as res
from funnel_test_reentry where uid = 1 group by uid format JSONCompactEachRow;
select uid, windowFunnel(100, 'strict_order', 'allow_reentry')(dt, event='a', event='b', event='a', event='c') as res
from funnel_test_reentry where uid = 1 group by uid format JSONCompactEachRow;
select uid, windowFunnel(100, 'strict_order')(dt, event='a', event='b', event='c') as res
from funnel_test_reentry where uid = 2 group by uid format JSONCompactEachRow;
select uid, windowFunnel(100, 'strict_order', 'allow_reentry')(dt, event='a', event='b', event='c') as res
from funnel_test_reentry where uid = 2 group by uid format JSONCompactEachRow;
select uid, windowFunnel(100, 'strict_order', 'allow_reentry')(dt, event='a', event='b', event='c') as res
from funnel_test_reentry where uid = 3 group by uid format JSONCompactEachRow;
