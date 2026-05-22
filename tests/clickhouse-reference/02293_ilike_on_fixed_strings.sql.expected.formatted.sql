DROP TABLE IF EXISTS tab;

CREATE TABLE tab
(
    col FixedString(2)
)
ENGINE = MergeTree()
ORDER BY col;

INSERT INTO tab;

SELECT
    col,
    like(col, '%a'),
    ilike(col, '%a')
FROM tab
WHERE col = 'AA';