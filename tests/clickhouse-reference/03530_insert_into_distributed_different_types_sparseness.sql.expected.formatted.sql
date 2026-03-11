SELECT dumpColumnStructure(*)
FROM sparse
LIMIT 1;

SELECT count()
FROM non_sparse;

SELECT count()
FROM mv_log;