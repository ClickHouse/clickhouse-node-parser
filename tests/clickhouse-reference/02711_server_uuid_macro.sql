-- The server UUID is correctly substituted.
SELECT engine_full LIKE ('%replica-{server_uuid}%') FROM system.tables WHERE database = currentDatabase() AND name = 'test';
SELECT count() > 0 FROM system.zookeeper WHERE path = '/clickhouse/tables/' || currentDatabase() || '/test/s1/replicas/' AND name LIKE 'replica-' || serverUUID()::String || '%';
-- The macro {server_uuid} is special, not a configuration-type macro. It's normal that it is inaccessible with the getMacro function.
SELECT getMacro('server_uuid'); -- { serverError NO_ELEMENTS_IN_CONFIG }
