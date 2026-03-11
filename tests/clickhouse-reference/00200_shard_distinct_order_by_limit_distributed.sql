SELECT DISTINCT number FROM remote('127.0.0.{2,3}', currentDatabase(), numbers_memory) ORDER BY number LIMIT 10;
