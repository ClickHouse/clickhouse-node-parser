CREATE TABLE foo
(
    bar String,
    PROJECTION p (    SELECT * APPLY(groupUniqArray(100)))
)
ENGINE = MergeTree
ORDER BY bar;