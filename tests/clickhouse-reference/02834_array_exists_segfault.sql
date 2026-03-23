DROP TABLE IF EXISTS 02834_t;
CREATE TABLE 02834_t (id UInt64, arr Array(UInt64)) ENGINE = MergeTree ORDER BY id;
SET enable_analyzer = 0;
SET enable_analyzer = 1;
INSERT INTO 02834_t VALUES (1, [1]), (2, [2]), (3, [1, 3]);
DROP TABLE 02834_t;
