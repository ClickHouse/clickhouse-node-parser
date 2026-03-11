SELECT *
FROM
    l AS L
LEFT JOIN r AS R
    ON L.y = R.y
WHERE R.ty >= 2019;

SELECT *
FROM
    l
LEFT JOIN r
    ON l.y = r.y
WHERE r.ty >= 2019;

SELECT *
FROM
    {CLICKHOUSE_DATABASE:Identifier}.l
LEFT JOIN {CLICKHOUSE_DATABASE:Identifier}.r
    ON l.y = r.y
WHERE r.ty >= 2019;