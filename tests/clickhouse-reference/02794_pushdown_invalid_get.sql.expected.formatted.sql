SELECT *
FROM (
        SELECT toInt128(NULL) AS x
        UNION ALL
        SELECT materialize(toInt128(-2))
    )
WHERE x;

SELECT *
FROM (
        SELECT toInt128(NULL) AS x
        UNION ALL
        SELECT materialize(toInt128(-2))
    )
WHERE x != 0;