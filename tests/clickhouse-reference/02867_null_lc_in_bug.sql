CREATE TABLE tnul (lc Nullable(String)) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO tnul VALUES (NULL), ('qwe');
SELECT lc FROM tnul WHERE notIn(lc, ('rty', 'uiop'));
CREATE TABLE tlc (lc LowCardinality(Nullable(String))) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO tlc VALUES (NULL), ('qwe');
SELECT lc FROM tlc WHERE notIn(lc, ('rty', 'uiop'));
