CREATE TABLE test_a
(
    id UInt32,
    company UInt32,
    total UInt64
)
ENGINE = SummingMergeTree()
PRIMARY KEY id
ORDER BY (id, company)
PARTITION BY company;

INSERT INTO test_a SELECT
    number % 10 AS id,
    number % 2 AS company,
    count() AS total
FROM numbers(100)
GROUP BY
    id,
    company;

CREATE TABLE test_b
(
    id UInt32,
    company UInt32,
    total UInt64
)
ENGINE = SummingMergeTree()
ORDER BY (id, company)
PARTITION BY company;