SELECT *
FROM b
WHERE id IN (SELECT id from a);
