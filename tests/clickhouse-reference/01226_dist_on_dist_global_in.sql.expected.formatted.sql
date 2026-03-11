SELECT *
FROM remote('localhost', `system`.one)
WHERE dummy GLOBAL IN (0);

SELECT *
FROM remote('localhost', `system`.one)
WHERE dummy GLOBAL IN (`system`.one);

SELECT *
FROM remote('localhost', `system`.one)
WHERE dummy GLOBAL IN (
        SELECT 0
    );

SELECT *
FROM remote('localhost', `system`.one)
WHERE dummy GLOBAL NOT IN (0);

SELECT *
FROM remote('localhost', `system`.one)
WHERE dummy GLOBAL NOT IN (`system`.one);

SELECT *
FROM remote('localhost', `system`.one)
WHERE dummy GLOBAL NOT IN (
        SELECT 0
    );