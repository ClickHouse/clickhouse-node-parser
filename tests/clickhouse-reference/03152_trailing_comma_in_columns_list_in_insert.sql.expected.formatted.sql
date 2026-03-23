CREATE TEMPORARY TABLE test
(
    a UInt8,
    b UInt8,
    c UInt8
);

INSERT INTO test (a, b, c);

INSERT INTO test (a, b, c);

SELECT *
FROM test
ORDER BY a ASC;