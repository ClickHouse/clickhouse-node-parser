CREATE TEMPORARY TABLE test
(
    i Int64,
    d DateTime
);

SELECT *
FROM test
ORDER BY i ASC;

CREATE TEMPORARY TABLE test
(
    i Int64,
    d DateTime64
);