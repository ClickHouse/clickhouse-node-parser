SELECT '---';
SELECT * FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY key;
SELECT count() FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100);
SELECT 1 FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100);
SELECT key FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY key;
SELECT b, a FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY a;
SELECT b, a FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY c;
SELECT b FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) WHERE c != 'twee' ORDER BY b;
SELECT count() FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) WHERE c != 'twee';
SELECT count() FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connection_pool_size = 1, connect_timeout = 100, connection_wait_timeout = 100);
SELECT count() FROM mysql('127.0.0.1:9004', currentDatabase(), foo, 'default', '', SETTINGS connection_pool_size = 0); -- { serverError BAD_ARGUMENTS }
SELECT * FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY key;
SELECT count() FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100);
SELECT 1 FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100);
SELECT key FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY key;
SELECT b, a FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY a;
SELECT b, a FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) ORDER BY c;
SELECT b FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) WHERE c != 'twee' ORDER BY b;
SELECT count() FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connect_timeout = 100, connection_wait_timeout = 100) WHERE c != 'twee';
SELECT count() FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connection_pool_size = 1, connect_timeout = 100, connection_wait_timeout = 100);
SELECT count() FROM mysql('[::1]:9004', currentDatabase(), foo, 'default', '', SETTINGS connection_pool_size = 0); -- { serverError BAD_ARGUMENTS }
