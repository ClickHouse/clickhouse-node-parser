SELECT * FROM (SELECT * FROM numbers(10)) js1 INNER JOIN testJoinTable USING number; -- { serverError INCOMPATIBLE_TYPE_OF_JOIN }
SELECT * FROM (SELECT * FROM numbers(10)) js1 INNER JOIN (SELECT * FROM testJoinTable) js2 USING number ORDER BY number;
SELECT * FROM (SELECT * FROM numbers(10)) js1 ANY INNER JOIN testJoinTable USING number ORDER BY number;
SELECT * FROM testJoinTable ORDER BY number;
SELECT tx.id, tx.value, m.name FROM transaction tx ANY LEFT JOIN master m ON m.id = tx.master_id ORDER BY tx.id;
SELECT * FROM tbl AS t ANY LEFT JOIN some_join USING (id) ORDER BY id;
SELECT * FROM tbl AS t ANY LEFT JOIN some_join AS d USING (id) ORDER BY id;
