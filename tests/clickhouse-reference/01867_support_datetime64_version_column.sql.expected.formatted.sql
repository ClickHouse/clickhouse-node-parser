CREATE TABLE replacing
(
    A Int64,
    D DateTime64(9, 'Asia/Istanbul'),
    S String
)
ENGINE = ReplacingMergeTree(D)
ORDER BY A;

SELECT *
FROM replacing;