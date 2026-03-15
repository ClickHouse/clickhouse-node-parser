CREATE TABLE dict_src
(
    id  UInt64,
    grp String
) ENGINE = Memory;
CREATE DICTIONARY colors
(
    id  UInt64,
    grp String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'dict_src'))
LAYOUT(HASHED())
LIFETIME(0);
SELECT dictGetKeys('colors', 'grp', 'blue') AS keys
FROM numbers(1);
CREATE TABLE src_products
(
    id UInt64,
    category String,
    brand String
)
ENGINE = Memory;
CREATE DICTIONARY dict_products
(
    id UInt64,
    category String,
    brand String
)
PRIMARY KEY id
SOURCE(CLICKHOUSE(TABLE 'src_products'))
LIFETIME(MIN 0 MAX 0)
LAYOUT(HASHED());
CREATE TABLE inputs
(
    target_category String,
    target_brand String,
    target_timezone String
)
ENGINE = Memory;
SELECT
    target_category,
    dictGetKeys('dict_products', 'category', target_category) AS product_ids_by_category_before
FROM inputs
ORDER BY target_category, target_brand, target_timezone;
SELECT
    target_category,
    dictGetKeys('dict_products', 'category', target_category) AS product_ids_by_category_after
FROM inputs
ORDER BY target_category, target_brand, target_timezone;
