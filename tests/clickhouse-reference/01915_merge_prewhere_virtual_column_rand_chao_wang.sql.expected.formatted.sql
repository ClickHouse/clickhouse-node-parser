SELECT f2
FROM merge(currentDatabase(), '^abc$')
PREWHERE _table = 'abc'
    AND f1 = 'a'
    AND rand() % 100 < 20;

SELECT f2
FROM merge(currentDatabase(), '^abc$')
PREWHERE _table = 'abc'
    AND f1 = 'a';

SELECT f2
FROM merge(currentDatabase(), '^abc$')
PREWHERE f1 = 'a'
    AND rand() % 100 < 20
WHERE _table = 'abc';

SELECT f2
FROM merge(currentDatabase(), '^abc$')
PREWHERE f1 = 'a'
WHERE _table = 'abc';