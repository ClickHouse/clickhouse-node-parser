SELECT b
FROM
    test
ARRAY JOIN p
WHERE b = 1
    AND c IN (
        SELECT c
        FROM test
    );