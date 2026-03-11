SELECT '-- Original issue with max_insert_delayed_streams_for_parallel_write <= 1';

SELECT *
FROM landing FINAL
ORDER BY time ASC;

SELECT *
FROM mv FINAL
ORDER BY hour ASC;

SELECT
    pk1,
    pk2,
    pk4,
    pk3,
    count() AS occurences
FROM landing
GROUP BY
    pk1,
    pk2,
    pk4,
    pk3
ORDER BY
    pk1 ASC,
    pk2 ASC,
    pk4 ASC,
    pk3 ASC;

SELECT
    pk1,
    pk2,
    pk4,
    pk3,
    countMerge(occurences) AS occurences
FROM ds
GROUP BY
    pk1,
    pk2,
    pk4,
    pk3
ORDER BY
    pk1 ASC,
    pk2 ASC,
    pk4 ASC,
    pk3 ASC;