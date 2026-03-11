SELECT number FROM numbers(10)    LIMIT 0.1;
SELECT number FROM numbers(100)   LIMIT 0.01;
SELECT number FROM numbers(1000)  LIMIT 0.001;
SELECT number FROM numbers(10)    LIMIT 0.5;
SELECT number FROM numbers(10)    LIMIT 0.9;
SELECT number FROM numbers(10)    LIMIT 0.99;
SELECT number FROM numbers(10)    OFFSET 0.1;
SELECT number FROM numbers(100)   OFFSET 0.01;
SELECT number FROM numbers(10)    OFFSET 0.5;
SELECT number FROM numbers(10)    OFFSET 0.9;
SELECT number FROM numbers(10)    OFFSET 0.99;
SELECT number FROM numbers(10)  LIMIT 0.1  OFFSET 0.1;
SELECT number FROM numbers(10)  LIMIT 0.1  OFFSET 0.2;
SELECT number FROM numbers(10)  LIMIT 0.1  OFFSET 0.5;
SELECT number FROM numbers(100) LIMIT 0.01 OFFSET 0.9;
SELECT number FROM numbers(10)  LIMIT 0.1  OFFSET 1;
SELECT number FROM numbers(10)  LIMIT 0.1  OFFSET 2;
SELECT number FROM numbers(10)  LIMIT 0.1  OFFSET 5;
SELECT number FROM numbers(100) LIMIT 0.01 OFFSET 90;
SELECT number FROM numbers(10)  LIMIT 1 OFFSET 0.1;
SELECT number FROM numbers(10)  LIMIT 1 OFFSET 0.2;
SELECT number FROM numbers(10)  LIMIT 1 OFFSET 0.5;
SELECT number FROM numbers(100) LIMIT 1 OFFSET 0.9;
SELECT number FROM numbers(1000) LIMIT 1 OFFSET 0.5;
SELECT number FROM numbers(1000) ORDER BY number DESC LIMIT 1 OFFSET 0.5;
SELECT number FROM numbers(12) LIMIT 0.25 OFFSET 0.5;
SELECT number FROM numbers(1000000) LIMIT 1 OFFSET 0.0999999;
SELECT 
    IF((count() = 5) AND (min(val) = 15) AND (max(val) = 19) AND (sum(val) = 85) AND (uniqExact(id) = 2), 'OK', 'FAIL')
FROM
(
    SELECT
        id,
        val
    FROM num_tab 
    ORDER BY val ASC 
    LIMIT 0.25 
    OFFSET 0.75
);
SELECT 
    number 
FROM 
    num_tab 
ORDER BY number
LIMIT 10 
OFFSET 0.99999;
