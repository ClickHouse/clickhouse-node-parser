SYSTEM DROP  TABLE IF EXISTS table_with_lc_key;

CREATE TABLE table_with_lc_key
(
    enum_key Enum8('x' = 2, 'y' = 1),
    lc_key LowCardinality(String),
    value String
)
ENGINE = MergeTree()
ORDER BY (enum_key, lc_key);

INSERT INTO table_with_lc_key;

SELECT *
FROM table_with_lc_key
WHERE enum_key > 0
    AND like(lc_key, 'h%');

SYSTEM DROP  TABLE IF EXISTS table_with_string_key;

CREATE TABLE table_with_string_key
(
    int_key Int8,
    str_key String,
    value String
)
ENGINE = MergeTree()
ORDER BY (int_key, str_key);

INSERT INTO table_with_string_key;

SELECT *
FROM table_with_string_key
WHERE int_key > 0
    AND like(str_key, 'h%');