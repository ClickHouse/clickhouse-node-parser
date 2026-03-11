SELECT '-- SELECT';

SELECT *
FROM (
        SELECT dummy AS k
        FROM remote('127.0.0.{1,2}', `system`.one)
    );