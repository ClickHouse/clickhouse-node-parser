CREATE TABLE summing_table01747
(
    some_name String,
    user_id UInt64,
    amount Int64,
    currency String
)
ENGINE = SummingMergeTree()
ORDER BY (some_name);

CREATE VIEW rates01747
AS
SELECT
    'USD' AS from_currency,
    'EUR' AS to_currency,
    1.2 AS rates01747;

INSERT INTO summing_table01747;

CREATE TABLE dictst01747
(
    some_name String,
    field1 String,
    field2 UInt8
)
ENGINE = Memory AS
SELECT
    'name',
    'test',
    33;

CREATE DICTIONARY default.dict01747
(
    some_name String,
    field1 String,
    field2 UInt8
)
PRIMARY KEY some_name
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() TABLE dictst01747 DB currentDatabase() USER 'default'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(COMPLEX_KEY_HASHED());

CREATE VIEW agg_view01747
AS
SELECT
    summing_table01747.some_name AS some_name,
    dictGet('default.dict01747', 'field1', tuple(some_name)) AS field1,
    dictGet('default.dict01747', 'field2', tuple(some_name)) AS field2,
    rates01747.rates01747 AS rates01747
FROM
    summing_table01747
LEFT JOIN rates01747
    ON rates01747.from_currency = summing_table01747.currency;

SELECT *
FROM agg_view01747;

SELECT field2
FROM agg_view01747
WHERE field1 = 'test';