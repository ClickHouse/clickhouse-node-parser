SELECT '-- Original issue with max_insert_delayed_streams_for_parallel_write <= 1';
SELECT * FROM landing FINAL ORDER BY time;
SELECT * FROM mv FINAL ORDER BY hour;
SELECT
    pk1,
    pk2,
    pk4,
    pk3,
    count() as occurences
FROM landing
GROUP BY pk1, pk2, pk4, pk3
ORDER BY pk1, pk2, pk4, pk3;
SELECT
    pk1,
    pk2,
    pk4,
    pk3,
    countMerge(occurences) AS occurences
FROM ds
GROUP BY pk1, pk2, pk4, pk3
ORDER BY pk1, pk2, pk4, pk3;
