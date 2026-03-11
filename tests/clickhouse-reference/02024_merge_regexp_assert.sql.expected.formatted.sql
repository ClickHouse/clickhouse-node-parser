SELECT a
FROM merge(REGEXP('.'), '^t$');

SELECT a
FROM merge(REGEXP('\0'), '^t$');

SELECT a
FROM merge(REGEXP('\0a'), '^t$');

SELECT a
FROM merge(REGEXP('\0a'), '^$');