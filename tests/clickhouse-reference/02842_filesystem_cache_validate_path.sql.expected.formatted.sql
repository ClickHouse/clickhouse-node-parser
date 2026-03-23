-- Tags: no-fasttest, no-replicated-database
SYSTEM DROP  TABLE IF EXISTS test;

SYSTEM DROP  TABLE IF EXISTS test_1;

SYSTEM DROP  TABLE IF EXISTS test_2;

CREATE TABLE test
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS disk = disk(type = cache, max_size = '1Mi', path = '/kek', disk = 'local_disk'); -- {serverError BAD_ARGUMENTS}

CREATE TABLE test
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS disk = disk(type = cache, max_size = '1Mi', path = '/var/lib/clickhouse/filesystem_caches/../kek', disk = 'local_disk'); -- {serverError BAD_ARGUMENTS}

CREATE TABLE test
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS disk = disk(type = cache, max_size = '1Mi', path = '../kek', disk = 'local_disk'); -- {serverError BAD_ARGUMENTS}

CREATE TABLE test_1
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS disk = disk(type = cache, max_size = '1Mi', path = '/var/lib/clickhouse/filesystem_caches/kek', disk = 'local_disk');

CREATE TABLE test_2
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS disk = disk(type = cache, max_size = '1Mi', path = 'kek2', disk = 'local_disk');