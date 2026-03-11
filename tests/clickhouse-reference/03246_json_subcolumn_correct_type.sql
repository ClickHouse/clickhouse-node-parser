select toTypeName(json.c0) from test;
SELECT 1 FROM (SELECT 1 AS c0) tx FULL OUTER JOIN test ON test.json.Float32 = tx.c0;
