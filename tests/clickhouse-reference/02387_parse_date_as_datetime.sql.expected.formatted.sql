CREATE TEMPORARY TABLE test
(
    i Int64,
    d DateTime
);

INSERT INTO test;

INSERT INTO test;

SELECT *
FROM test
ORDER BY i ASC;

CREATE TEMPORARY TABLE test
(
    i Int64,
    d DateTime64
);