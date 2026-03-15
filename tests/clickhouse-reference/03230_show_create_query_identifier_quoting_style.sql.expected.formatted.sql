-- Create tables, views, dictionaries
CREATE TABLE uk_price_paid
(
    Table String,
    Engine String,
    price UInt32,
    date Date,
    postcode1 LowCardinality(String),
    postcode2 LowCardinality(String),
    type Enum('terraced' = 1, 'semi-detached' = 2, 'detached' = 3, 'flat' = 4, 'other' = 0),
    is_new UInt8,
    duration Enum('freehold' = 1, 'leasehold' = 2, 'unknown' = 0),
    addr1 String,
    addr2 String,
    street LowCardinality(String),
    locality LowCardinality(String),
    town LowCardinality(String),
    district LowCardinality(String),
    county LowCardinality(String),
    INDEX county_index county TYPE set(10) GRANULARITY 1,
    PROJECTION town_date_projection (    SELECT
        town,
        date,
        price
    ORDER BY
        town ASC,
        date ASC),
    PROJECTION handy_aggs_projection (    SELECT
        avg(price),
        max(price),
        sum(price)
    GROUP BY town)
)
ENGINE = MergeTree
ORDER BY (postcode1, postcode2, date);

CREATE TABLE prices_by_year_dest
(
    Table String,
    Engine String,
    price UInt32,
    date Date,
    addr1 String,
    addr2 String,
    street LowCardinality(String),
    town LowCardinality(String),
    district LowCardinality(String),
    county LowCardinality(String)
)
ENGINE = MergeTree
PRIMARY KEY (town, date)
PARTITION BY toYear(date);

CREATE MATERIALIZED VIEW prices_by_year_view
TO prices_by_year_dest
AS
SELECT
    price,
    date,
    addr1,
    addr2,
    street,
    town,
    district,
    county
FROM uk_price_paid;

CREATE TABLE uk_prices_aggs_dest
(
    month Date,
    min_price SimpleAggregateFunction(min, UInt32),
    max_price SimpleAggregateFunction(max, UInt32),
    volume AggregateFunction(count, UInt32),
    avg_price AggregateFunction(avg, UInt32)
)
ENGINE = AggregatingMergeTree
PRIMARY KEY month;

CREATE MATERIALIZED VIEW uk_prices_aggs_view
TO uk_prices_aggs_dest
AS
WITH toStartOfMonth(date) AS month

SELECT
    month,
    minSimpleState(price) AS min_price,
    maxSimpleState(price) AS max_price,
    countState(price) AS volume,
    avgState(price) AS avg_price
FROM uk_price_paid
GROUP BY month;

CREATE TABLE uk_mortgage_rates
(
    date DateTime64,
    variable Decimal32(2),
    fixed Decimal32(2),
    bank Decimal32(2)
)
ENGINE = Memory();

CREATE DICTIONARY uk_mortgage_rates_dict
(
    date DateTime64,
    variable Decimal32(2),
    fixed Decimal32(2),
    bank Decimal32(2)
)
PRIMARY KEY date
SOURCE(clickhouse(TABLE 'uk_mortgage_rates'))
LIFETIME(2628000000)
LAYOUT(COMPLEX_KEY_HASHED());

-- Show tables, views, dictionaries with default settings
SELECT ('Settings: default');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='always', show_create_query_identifier_quoting_style='Backticks'
SELECT ('Settings: always & Backticks');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='user_display', show_create_query_identifier_quoting_style='Backticks'
SELECT ('Settings: user_display & Backticks');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='when_necessary', show_create_query_identifier_quoting_style='Backticks'
SELECT ('Settings: when_necessary & Backticks');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='always', show_create_query_identifier_quoting_style='DoubleQuotes'
SELECT ('Settings: always & DoubleQuotes');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='user_display', show_create_query_identifier_quoting_style='DoubleQuotes'
SELECT ('Settings: user_display & DoubleQuotes');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='when_necessary', show_create_query_identifier_quoting_style='DoubleQuotes'
SELECT ('Settings: when_necessary & DoubleQuotes');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='always', show_create_query_identifier_quoting_style='BackticksMySQL'
SELECT ('Settings: always & BackticksMySQL');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='user_display', show_create_query_identifier_quoting_style='BackticksMySQL'
SELECT ('Settings: user_display & BackticksMySQL');

-- Show tables, views, dictionaries with show_create_query_identifier_quoting_rule='when_necessary', show_create_query_identifier_quoting_style='BackticksMySQL'
SELECT ('Settings: when_necessary & BackticksMySQL');