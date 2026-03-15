CREATE TABLE tab
(
    col FixedString(2)
)
ENGINE = MergeTree()
ORDER BY col;

SELECT
    col,
    like(col, '%a'),
    ilike(col, '%a')
FROM tab
WHERE col = 'AA';