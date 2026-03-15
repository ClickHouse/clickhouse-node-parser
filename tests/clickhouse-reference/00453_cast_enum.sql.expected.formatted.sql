SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE cast_enums
(
    type Enum8('session' = 1, 'pageview' = 2, 'click' = 3),
    date Date,
    id UInt64
)
ENGINE = MergeTree(date, (type, date, id), 8192);

SELECT
    type,
    date,
    id
FROM cast_enums
ORDER BY
    type ASC,
    id ASC;