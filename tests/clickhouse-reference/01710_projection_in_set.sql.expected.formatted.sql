SELECT
    sum(j),
    avg(k)
FROM x
WHERE i IN (
        SELECT number
        FROM numbers(4)
    );

SELECT
    j,
    k
FROM x
WHERE i IN (
        SELECT number
        FROM numbers(4)
    );

SELECT if(SrcAS IN (
        SELECT SrcAS
        FROM flows
        GROUP BY SrcAS
        ORDER BY sum(Bytes) DESC
        LIMIT 10
    ), SrcAS, 33) AS SrcAS
FROM flows
WHERE 2 == 2
ORDER BY SrcAS ASC;