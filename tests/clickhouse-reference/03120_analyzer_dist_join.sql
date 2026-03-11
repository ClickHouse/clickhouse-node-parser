SELECT id, count()
FROM a1 AS a1
LEFT JOIN b1 AS b1 ON a1.id = b1.id
GROUP BY id
ORDER BY id;
SELECT id, count()
FROM a1 a1
LEFT JOIN (SELECT id FROM b1 b1) b1 ON a1.id = b1.id
GROUP BY id
ORDER BY id;
SELECT id, count()
FROM (SELECT id FROM a1) a1
LEFT JOIN (SELECT id FROM b1) b1 ON a1.id = b1.id
GROUP BY id
ORDER BY id;
