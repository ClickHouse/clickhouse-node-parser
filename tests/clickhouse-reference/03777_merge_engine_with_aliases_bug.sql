SELECT * FROM merge(currentDatabase(), '^test.*') order by all;
SELECT a, b, c, a_a FROM merge(currentDatabase(), '^test.*') order by all;
