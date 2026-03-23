CREATE TABLE tnul
(
    lc Nullable(String)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tnul;

SELECT lc
FROM tnul
WHERE notIn(lc, ('rty', 'uiop'));

CREATE TABLE tlc
(
    lc LowCardinality(Nullable(String))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tlc;

SELECT lc
FROM tlc
WHERE notIn(lc, ('rty', 'uiop'));