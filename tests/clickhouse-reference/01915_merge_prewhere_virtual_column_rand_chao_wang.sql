-- In version 20.12 this query sometimes produces an exception "Cannot find column"
SELECT f2 FROM merge(currentDatabase(), '^abc$') PREWHERE _table = 'abc' AND f1 = 'a' AND rand() % 100 < 20; -- { serverError ILLEGAL_PREWHERE }
SELECT f2 FROM merge(currentDatabase(), '^abc$') PREWHERE _table = 'abc' AND f1 = 'a'; -- { serverError ILLEGAL_PREWHERE }
SELECT f2 FROM merge(currentDatabase(), '^abc$') PREWHERE f1 = 'a' AND rand() % 100 < 20 WHERE _table = 'abc';
SELECT f2 FROM merge(currentDatabase(), '^abc$') PREWHERE f1 = 'a' WHERE _table = 'abc';
