SELECT *
FROM t
WHERE id2 = 3
FORMAT Null;

SELECT sum(id3)
FROM t
GROUP BY id2
FORMAT Null;

SELECT min(id)
FROM t
FORMAT Null;

SELECT
    --Remove the prefix string which is a mutable database name.
    arrayStringConcat(arrayPopFront(splitByString('.', projections[1])), '.')
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT * FROM t WHERE id2 = 3 FORMAT Null;';

SELECT
    --Remove the prefix string which is a mutable database name.
    arrayStringConcat(arrayPopFront(splitByString('.', projections[1])), '.')
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT sum(id3) FROM t GROUP BY id2 FORMAT Null;';

SELECT
    --Remove the prefix string which is a mutable database name.
    arrayStringConcat(arrayPopFront(splitByString('.', projections[1])), '.')
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND query = 'SELECT min(id) FROM t FORMAT Null;';