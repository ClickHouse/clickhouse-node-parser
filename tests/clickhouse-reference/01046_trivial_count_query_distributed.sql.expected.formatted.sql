SELECT count(1)
FROM remote('127.0.0.{1,1,2}', currentDatabase(), test_count);