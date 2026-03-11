SELECT *
FROM tab
PREWHERE indexHint(indexHint(-1, 0.))
WHERE has(foo, 'b');
SELECT *
FROM tab
PREWHERE indexHint(0);
