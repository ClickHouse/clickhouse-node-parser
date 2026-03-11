SELECT * FROM remote('127.0.0.1', currentDatabase(), 'simple') ORDER BY d;
SELECT * FROM remote('127.0.0.2', currentDatabase(), 'simple') ORDER BY d;
