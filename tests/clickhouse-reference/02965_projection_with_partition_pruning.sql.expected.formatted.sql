SELECT *
FROM a
WHERE i > 0
    AND j = 4
SETTINGS force_index_by_date = 1;