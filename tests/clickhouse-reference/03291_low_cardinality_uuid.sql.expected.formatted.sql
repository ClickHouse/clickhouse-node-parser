-- creating this data type is allowed by default:
CREATE TEMPORARY TABLE test
(
    x LowCardinality(UUID)
);

SELECT *
FROM test;