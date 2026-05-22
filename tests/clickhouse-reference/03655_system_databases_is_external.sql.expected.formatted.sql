-- Tags: no-fasttest
-- - no-fasttest -- no SQLite
SET allow_deprecated_database_ordinary = 1;

-- Suppress "Server has databases (for example `X`) with Ordinary engine, which was deprecated."
SET send_logs_level = 'error';

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier}
ENGINE = Ordinary;

SELECT
    engine,
    is_external
FROM `system`.databases
WHERE name = {CLICKHOUSE_DATABASE_1:String};

DROP DATABASE {CLICKHOUSE_DATABASE_1:Identifier};

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier}
ENGINE = Atomic;

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier}
ENGINE = Memory;

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier}
ENGINE = Replicated('/test/{database}/rdb', 's1', 'r1');

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier}
ENGINE = SQLite({CLICKHOUSE_DATABASE_1:String});