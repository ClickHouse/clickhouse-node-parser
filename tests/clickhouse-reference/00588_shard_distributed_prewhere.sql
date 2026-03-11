SELECT * FROM mergetree_00588 PREWHERE x = 1 WHERE s LIKE '%l%' ORDER BY x, s;
SELECT * FROM remote('127.0.0.{1,2,3}', currentDatabase(), mergetree_00588) PREWHERE x = 1 WHERE s LIKE '%l%' ORDER BY x, s;
SELECT * FROM distributed_00588 PREWHERE x = 1 WHERE s LIKE '%l%' ORDER BY x, s;
