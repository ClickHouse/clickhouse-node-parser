CREATE TABLE tnul
(
    lc Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT lc
FROM tnul
WHERE notIn(lc, ('rty', 'uiop'));

CREATE TABLE tlc
(
    lc LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT lc
FROM tlc
WHERE notIn(lc, ('rty', 'uiop'));