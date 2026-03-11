SELECT '---- arrays ----';

SELECT cityHash64(toString(groupArray(tuple(*))))
FROM (
        SELECT
            brand_id,
            rack_id,
            arrayJoin(arraySlice(arraySort(groupArray(quantity)), 1, 2)) AS quantity
        FROM stack
        GROUP BY
            brand_id,
            rack_id
        ORDER BY
            brand_id ASC,
            rack_id ASC,
            quantity ASC
    ) AS t;

SELECT cityHash64(toString(groupArray(tuple(*))))
FROM (
        SELECT
            brand_id,
            rack_id,
            quantity
        FROM (
                SELECT
                    brand_id,
                    rack_id,
                    quantity,
                    row_number() OVER (PARTITION BY brand_id, rack_id ORDER BY quantity ASC) AS rn
                FROM stack
            ) AS t0
        WHERE rn <= 2
        ORDER BY
            brand_id ASC,
            rack_id ASC,
            quantity ASC
    ) AS t;