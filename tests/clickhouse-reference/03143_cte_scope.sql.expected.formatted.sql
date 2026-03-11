SELECT
    tb1.*,
    tb2.*
FROM
    (
        WITH tmp0 AS (
            SELECT
                k1,
                k2,
                d1
            FROM tmp_a
        ),

        tmp_s AS (
            SELECT
                k1,
                k2,
                d0
            FROM tmp_b
        ),

        tmp1 AS (
            SELECT
                tmp0.*,
                tmp_s.d0
            FROM
                tmp0
            LEFT JOIN tmp_s
                ON tmp0.k1 = tmp_s.k1
                AND tmp0.k2 = tmp_s.k2
        )

        SELECT *
        FROM tmp1
    ) AS tb1
LEFT JOIN (
        WITH tmp0 AS (
            SELECT
                k1,
                k2,
                d2
            FROM tmp_a
        ),

        tmp_s AS (
            SELECT
                k1,
                k2,
                d0
            FROM tmp_b
        ),

        tmp1 AS (
            SELECT
                tmp0.*,
                tmp_s.d0
            FROM
                tmp0
            LEFT JOIN tmp_s
                ON tmp0.k1 = tmp_s.k1
                AND tmp0.k2 = tmp_s.k2
        )

        SELECT *
        FROM tmp1
    ) AS tb2
    ON tb1.k1 = tb2.k1
    AND tb1.k2 = tb2.k2
ORDER BY k1 ASC;