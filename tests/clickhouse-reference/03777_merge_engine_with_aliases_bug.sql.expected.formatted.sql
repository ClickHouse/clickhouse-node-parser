SELECT *
FROM merge(currentDatabase(), '^test.*')
ORDER BY `all` ASC;

SELECT
    a,
    b,
    c,
    a_a
FROM merge(currentDatabase(), '^test.*')
ORDER BY `all` ASC;