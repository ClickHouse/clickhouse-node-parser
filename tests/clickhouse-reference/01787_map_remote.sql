SELECT map('a', 1, 'b', 2) FROM remote('127.0.0.{1,2}', system, one);
SELECT map('a', 1, 'b', 2) FROM remote('127.0.0.{1,2}');
SELECT map() from remote('127.0.0.{1,2}', system,one);
SELECT if(1, attributes, map()) from remote('127.0.0.{1,2}', currentDatabase(), bug_repro_local) limit 1;
