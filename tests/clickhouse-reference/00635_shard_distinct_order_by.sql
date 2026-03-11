SELECT DISTINCT s FROM remote('127.0.0.{1,2}', currentDatabase(), data) ORDER BY x + y, s;
