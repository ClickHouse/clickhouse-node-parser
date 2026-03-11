SELECT
    count(),
    concat(dynamicType(d), ':', dynamicType(d.`Tuple(a Dynamic(max_types=2))`.a)) AS type,
    isDynamicElementInSharedData(d.`Tuple(a Dynamic(max_types=2))`.a) AS flag
FROM test
GROUP BY
    type,
    flag
ORDER BY
    count() ASC,
    type ASC;

SELECT '---------------------';