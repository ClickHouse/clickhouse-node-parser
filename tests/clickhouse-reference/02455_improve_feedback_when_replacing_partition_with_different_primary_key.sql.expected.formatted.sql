CREATE TABLE test_a
(
    id UInt32,
    company UInt32,
    total UInt64
)
ENGINE = SummingMergeTree()
ORDER BY (id, company)
PARTITION BY company
PRIMARY KEY id;

CREATE TABLE test_b
(
    id UInt32,
    company UInt32,
    total UInt64
)
ENGINE = SummingMergeTree()
ORDER BY (id, company)
PARTITION BY company;