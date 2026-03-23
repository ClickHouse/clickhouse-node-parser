SYSTEM drop  table if exists foo;

CREATE TABLE foo
(
    bar String,
    PROJECTION p (    SELECT * APPLY(groupUniqArray(100)))
)
ENGINE = MergeTree
ORDER BY bar;

SYSTEM drop  table foo;