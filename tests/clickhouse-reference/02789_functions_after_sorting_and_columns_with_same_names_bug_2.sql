SELECT * FROM (
        SELECT  m0.pt                                                                                     AS pt
               ,m0.`uvctr`                                                                                AS uvctr
               ,round(m1.uvctr,4)                                                                         AS uvctr_hb_last_value
               ,round(m2.uvctr,4)                                                                         AS uvctr_tb_last_value
        FROM
        (
                SELECT  m0.pt                                                                                                           AS pt
                       ,COALESCE(m0.brand_name,m1.brand_name)                                                                           AS brand_name
                       ,if(isNaN(`click_uv` / `exposure_uv`) OR isInfinite(`click_uv` / `exposure_uv`),NULL,`click_uv` / `exposure_uv`) AS `uvctr`
                FROM
                (
                                SELECT  pt          AS pt
                                       ,brand_name  AS `brand_name`
                                       ,exposure_uv AS `exposure_uv`
                                       ,click_uv    AS `click_uv`
                                FROM test2
                                WHERE pt = '20230626'
                ) m0
                FULL JOIN
                (
                                SELECT  pt                        AS pt
                                       ,brand_name                AS `brand_name`
                                       ,total_indirect_order_cnt  AS `total_indirect_order_cnt`
                                       ,total_indirect_gmv        AS `total_indirect_gmv`
                                FROM test1
                                WHERE pt = '20230626'
                ) m1
                ON m0.brand_name = m1.brand_name AND m0.pt = m1.pt
        ) m0
        LEFT JOIN
        (
                SELECT  m0.pt AS pt
                       ,if(isNaN(`click_uv` / `exposure_uv`) OR isInfinite(`click_uv` / `exposure_uv`),NULL,`click_uv` / `exposure_uv`) AS `uvctr`
                       ,COALESCE(m0.brand_name,m1.brand_name)                                                                 AS brand_name
                       ,`exposure_uv`                                                                                         AS `exposure_uv`
                       ,`click_uv`
                FROM
                (
                                SELECT  pt          AS pt
                                       ,brand_name  AS `brand_name`
                                       ,exposure_uv AS `exposure_uv`
                                       ,click_uv    AS `click_uv`
                                FROM test2
                                WHERE pt = '20230625'
                ) m0
                FULL JOIN
                (
                                SELECT  pt                       AS pt
                                       ,brand_name               AS `brand_name`
                                       ,total_indirect_order_cnt AS `total_indirect_order_cnt`
                                       ,total_indirect_gmv       AS `total_indirect_gmv`
                                FROM test1
                                WHERE pt = '20230625'
                ) m1
                ON m0.brand_name = m1.brand_name AND m0.pt = m1.pt
        ) m1
        ON m0.brand_name = m1.brand_name AND m0.pt = m1.pt
        LEFT JOIN
        (
                SELECT  m0.pt AS pt
                       ,if(isNaN(`click_uv` / `exposure_uv`) OR isInfinite(`click_uv` / `exposure_uv`),NULL,`click_uv` / `exposure_uv`) AS `uvctr`
                       ,COALESCE(m0.brand_name,m1.brand_name)                                                                 AS brand_name
                       ,`exposure_uv`                                                                                         AS `exposure_uv`
                       ,`click_uv`
                FROM
                (
                                SELECT  pt          AS pt
                                       ,brand_name  AS `brand_name`
                                       ,exposure_uv AS `exposure_uv`
                                       ,click_uv    AS `click_uv`
                                FROM test2
                                WHERE pt = '20220626'
                ) m0
                FULL JOIN
                (
                                SELECT  pt                        AS pt
                                       ,brand_name                AS `brand_name`
                                       ,total_indirect_order_cnt  AS `total_indirect_order_cnt`
                                       ,total_indirect_gmv        AS `total_indirect_gmv`
                                FROM test1
                                WHERE pt = '20220626'
                ) m1
                ON m0.brand_name = m1.brand_name AND m0.pt = m1.pt
        ) m2
        ON m0.brand_name = m2.brand_name AND m0.pt = m2.pt
) c0
ORDER BY pt ASC, uvctr DESC;
