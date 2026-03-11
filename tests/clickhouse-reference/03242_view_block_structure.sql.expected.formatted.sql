SELECT *
FROM b
WHERE id IN (
        SELECT id
        FROM a
    );