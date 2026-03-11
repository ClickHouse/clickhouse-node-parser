SELECT x
FROM (
        SELECT
            dummy AS x,
            dummy + 1 AS dummy
        ORDER BY identity(x) ASC
    )
FORMAT Null;