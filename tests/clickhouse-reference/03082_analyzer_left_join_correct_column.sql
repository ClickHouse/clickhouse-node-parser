SELECT t1.pk, t2.x.y
FROM test1 t1
LEFT JOIN test2 t2
	on t1.pk = t2.pk;
SELECT t1.pk, t2.`x.y`
FROM test1 t1
LEFT JOIN test2 t2
	on t1.pk = t2.pk;
