SELECT
    col,
    like(col, '%a'),
    ilike(col, '%a')
FROM tab
WHERE col = 'AA';