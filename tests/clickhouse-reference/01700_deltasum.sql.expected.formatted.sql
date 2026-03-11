SELECT deltaSum(arrayJoin([1, 2, 3]));

SELECT deltaSum(arrayJoin([1, 2, 3, 0, 3, 4]));

SELECT deltaSum(arrayJoin([1, 2, 3, 0, 3, 4, 2, 3]));

SELECT deltaSum(arrayJoin([1, 2, 3, 0, 3, 3, 3, 3, 3, 4, 2, 3]));

SELECT deltaSum(arrayJoin([1, 2, 3, 0, 0, 0, 0, 3, 3, 3, 3, 3, 4, 2, 3]));

SELECT deltaSumMerge(`rows`) AS delta_sum
FROM (
        SELECT *
        FROM (
                SELECT
                    1 AS x,
                    deltaSumState(arrayJoin([0, 1])) AS `rows`
                UNION ALL
                SELECT
                    2,
                    deltaSumState(arrayJoin([4, 5])) AS `rows`
            )
        ORDER BY x ASC
    )
ORDER BY delta_sum ASC;

SELECT deltaSumMerge(`rows`) AS delta_sum
FROM (
        SELECT *
        FROM (
                SELECT
                    1 AS x,
                    deltaSumState(arrayJoin([4, 5])) AS `rows`
                UNION ALL
                SELECT
                    2,
                    deltaSumState(arrayJoin([0, 1])) AS `rows`
            )
        ORDER BY x ASC
    )
ORDER BY delta_sum ASC;

SELECT deltaSum(arrayJoin([2.25, 3, 4.5]));

SELECT deltaSumMerge(`rows`) AS delta_sum
FROM (
        SELECT *
        FROM (
                SELECT
                    1 AS x,
                    deltaSumState(arrayJoin([0.1, 0.3, 0.5])) AS `rows`
                UNION ALL
                SELECT
                    2,
                    deltaSumState(arrayJoin([4.1, 5.1, 6.6])) AS `rows`
            )
        ORDER BY x ASC
    )
ORDER BY delta_sum ASC;

SELECT deltaSumMerge(`rows`) AS delta_sum
FROM (
        SELECT *
        FROM (
                SELECT
                    1 AS x,
                    deltaSumState(arrayJoin([3, 5])) AS `rows`
                UNION ALL
                SELECT
                    2,
                    deltaSumState(arrayJoin([1, 2])) AS `rows`
                UNION ALL
                SELECT
                    3,
                    deltaSumState(arrayJoin([4, 6])) AS `rows`
            )
        ORDER BY x ASC
    )
ORDER BY delta_sum ASC;