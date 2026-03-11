SELECT map('a', 1, 'b', 2)
FROM remote('127.0.0.{1,2}', `system`, one);

SELECT map('a', 1, 'b', 2)
FROM remote('127.0.0.{1,2}');

SELECT map()
FROM remote('127.0.0.{1,2}', `system`, one);

SELECT if(1, attributes, map())
FROM remote('127.0.0.{1,2}', currentDatabase(), bug_repro_local)
LIMIT 1;