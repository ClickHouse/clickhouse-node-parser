SELECT *
FROM
(
    SELECT
        x,
        length(x)
    FROM tbl_repr
    WHERE ts > now()
    LIMIT 1
)
WHERE x != '';
