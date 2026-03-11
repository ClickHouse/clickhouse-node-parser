SELECT
    toYYYYMM(date) AS date_,
    n
FROM
    (
        SELECT
            [toDate('20230815'), toDate('20230816')] AS date,
            [1, 2] AS n
    ) AS data
ARRAY JOIN date, n
WHERE date_ >= 202303;