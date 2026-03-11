SELECT cityHash64(groupArray(A))
FROM (
        SELECT A
        FROM t
        ORDER BY A DESC
        LIMIT 10
    );

SELECT cityHash64(groupArray(A))
FROM (
        SELECT A
        FROM t
        ORDER BY identity(A) DESC
        LIMIT 10
    );