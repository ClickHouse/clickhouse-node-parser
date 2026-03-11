SELECT
    uniqTheta(x), uniqTheta((x)), uniqTheta(x, y), uniqTheta((x, y)), uniqTheta(x, y, z), uniqTheta((x, y, z))
FROM
(
    SELECT
        number % 10 AS x,
        intDiv(number, 10) % 10 AS y,
        toString(intDiv(number, 100) % 10) AS z
    FROM system.numbers LIMIT 1000
);
SELECT k,
    uniqTheta(x), uniqTheta((x)), uniqTheta(x, y), uniqTheta((x, y)), uniqTheta(x, y, z), uniqTheta((x, y, z)),
    count() AS c
FROM
(
    SELECT
        (number + 0x8ffcbd8257219a26) * 0x66bb3430c06d2353 % 131 AS k,
        number % 10 AS x,
        intDiv(number, 10) % 10 AS y,
        toString(intDiv(number, 100) % 10) AS z
    FROM system.numbers LIMIT 100000
)
GROUP BY k
ORDER BY c DESC, k ASC
LIMIT 10;
SELECT count(DISTINCT x) FROM (SELECT number % 123 AS x FROM system.numbers LIMIT 1000);
SELECT count(DISTINCT x, y) FROM (SELECT number % 11 AS x, number % 13 AS y FROM system.numbers LIMIT 1000);
SELECT uniqThetaArray([0, 1, 1], [0, 1, 1], [0, 1, 1]);
SELECT uniqThetaArray([0, 1, 1], [0, 1, 1], [0, 1, 0]);
SELECT uniqTheta(x) FROM (SELECT arrayJoin([[1, 2], [1, 2], [1, 2, 3], []]) AS x);
SELECT uniqTheta(x) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta(x) FROM (SELECT arrayJoin([[[]], [['a', 'b']], [['a'], ['b']], [['a', 'b']]]) AS x);
SELECT uniqTheta(x, x) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta(x, arrayMap(elem -> [elem, elem], x)) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta(x, toString(x)) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta((x, x)) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta((x, arrayMap(elem -> [elem, elem], x))) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta((x, toString(x))) FROM (SELECT arrayJoin([[], ['a'], ['a', 'b'], []]) AS x);
SELECT uniqTheta(x) FROM (SELECT arrayJoin([[], ['a'], ['a', NULL, 'b'], []]) AS x);
SELECT (uniqTheta(a), uniqTheta(b), uniqTheta(c))
FROM (SELECT * FROM decimal ORDER BY a);
SELECT uniqMerge(Uniq), uniqThetaMerge(UniqThetaSketch) FROM stored_aggregates;
SELECT d, uniqMerge(Uniq), uniqThetaMerge(UniqThetaSketch) FROM stored_aggregates GROUP BY d ORDER BY d;
SELECT d, k1, k2,
	uniqMerge(Uniq), uniqThetaMerge(UniqThetaSketch)
FROM stored_aggregates
GROUP BY d, k1, k2
ORDER BY d, k1, k2;
SELECT d, k1,
	uniqMerge(Uniq), uniqThetaMerge(UniqThetaSketch)
FROM stored_aggregates
GROUP BY d, k1
ORDER BY d, k1;
select k, sum(c), uniqMerge(un), uniqThetaMerge(ut) from summing_merge_tree_aggregate_function group by k order by k;
