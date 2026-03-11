SELECT id
FROM
    join_on_disk AS lhs
LEFT JOIN (
        SELECT id
        FROM join_on_disk
        GROUP BY id
    ) AS rhs
    USING (id)
FORMAT Null;