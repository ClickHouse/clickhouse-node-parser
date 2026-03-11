SELECT 1 FROM remote('localhost', currentDatabase(), t0) AS t0
JOIN t0 t1 ON FALSE
RIGHT JOIN t0 t2 ON FALSE;
