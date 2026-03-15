CREATE TEMPORARY TABLE test
(
    a UInt8,
    b UInt8,
    c UInt8
);

SELECT *
FROM test
ORDER BY a ASC;