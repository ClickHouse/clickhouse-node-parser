SELECT 1
FROM
    remote('127.{1,2}', currentDatabase(), test_01081) AS lhs
INNER JOIN `system`.one AS rhs
    ON rhs.dummy = 1
ORDER BY 1 ASC
SETTINGS enable_analyzer = 0;

SELECT 1
FROM
    remote('127.{1,2}', currentDatabase(), test_01081) AS lhs
INNER JOIN `system`.one AS rhs
    ON rhs.dummy = 1
ORDER BY 1 ASC
SETTINGS enable_analyzer = 1;