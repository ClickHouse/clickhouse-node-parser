-- Tags: no-parallel, no-fasttest
SET prefer_localhost_replica = 1;

CREATE TABLE file
(
    n Int8
)
ENGINE = File(concat(upper('tsv'), 'WithNames', 'AndTypes'));

CREATE TABLE buffer
(
    n Int8
)
ENGINE = Buffer(currentDatabase(), file, 16, 10, 200, 10000, 1000000, 10000000, 1000000000);

CREATE TABLE merge
(
    n Int8
)
ENGINE = Merge('', lower('DISTRIBUTED'));

CREATE TABLE merge_tf AS merge(currentDatabase(), '.*');

CREATE TABLE distributed
(
    n Int8
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), concat('fi', 'le'));

CREATE TABLE distributed_tf AS cluster(concat('test', '_', 'shard_localhost'), '', concat('buf', 'fer'));

CREATE TABLE url
(
    n UInt64,
    col String
)
ENGINE = URL(replace(concat('https://localhost:', getServerPort('https_port'), '/?query=', 'select n, _table from ', currentDatabase(), '.merge format CSV'), ' ', '+'), CSV);

CREATE VIEW view
AS
SELECT toInt64(n) AS n
FROM (
        SELECT toString(n) AS n
        FROM merge
        WHERE _table != 'qwerty'
        ORDER BY _table ASC
    )
UNION ALL
SELECT *
FROM file;

-- The following line is needed just to disable checking stderr for emptiness
SELECT nonexistentsomething; -- { serverError UNKNOWN_IDENTIFIER }

CREATE DICTIONARY dict
(
    n UInt64,
    col String DEFAULT '42'
)
PRIMARY KEY n
SOURCE(clickhouse(HOST 'localhost' PORT getServerPort('tcp_port_secure') SECURE 1 USER 'default' TABLE 'url'))
LIFETIME(1)
LAYOUT(CACHE(SIZE_IN_CELLS 1));

-- dict --> url --> merge |-> distributed -> file (1)
--                        |-> distributed_tf -> buffer -> file (1)
-- TODO make fuzz test from this
CREATE TABLE rich_syntax AS remote('localhos{x|y|t}', cluster(concat('test', '_', 'shard_localhost'), remote('127.0.0.{1..4}', if(toString(40 + 2) NOT IN ('hello', dictGetString(concat(currentDatabase(), '.dict'), 'col', toUInt64('0001'))), currentDatabase(), 'FAIL'), extract('123view456', '[a-z]+'))));

-- remote(localhost) --> cluster(test_shard_localhost) |-> remote(127.0.0.1) --> view |-> subquery --> merge |-> distributed --> file (1)
--                                                     |                              |                      |-> distributed_tf -> buffer (1) -> file (1)
--                                                     |                              |-> file (1)
--                                                     |-> remote(127.0.0.2) --> ...
SELECT sum(n)
FROM rich_syntax
SETTINGS enable_parallel_replicas = 0;

SELECT sum(n)
FROM rich_syntax
SETTINGS serialize_query_plan = 0;