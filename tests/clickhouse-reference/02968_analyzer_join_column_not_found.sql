SELECT *
FROM im AS m
INNER JOIN (
    SELECT tid, dd, t.id
    FROM im AS m
    INNER JOIN ts AS t ON m.id = t.id
) AS t ON m.dd = t.dd
;
