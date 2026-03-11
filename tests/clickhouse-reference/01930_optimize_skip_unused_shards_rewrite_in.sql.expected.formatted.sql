SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt8(id) AS id
        FROM data
    )), toInt8(id))
WHERE id IN (0, 1, 0x7f)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt8(id) AS id
        FROM data
    )), toUInt8(id))
WHERE id IN (0, 1, 0x7f)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt8(id) AS id
        FROM data
    )), toUInt8(id))
WHERE id IN (0, 1, 0x7f, 0x80, 0xff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt8(id) AS id
        FROM data
    )), toInt8(id))
WHERE id IN (0, 1, 0x7f, 0x80, 0xff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt16(id) AS id
        FROM data
    )), toInt16(id))
WHERE id IN (0, 1, 0x7fff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt16(id) AS id
        FROM data
    )), toUInt16(id))
WHERE id IN (0, 1, 0x7fff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt16(id) AS id
        FROM data
    )), toUInt16(id))
WHERE id IN (0, 1, 0x7fff, 0x8000, 0xffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt16(id) AS id
        FROM data
    )), toInt16(id))
WHERE id IN (0, 1, 0x7fff, 0x8000, 0xffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt32(id) AS id
        FROM data
    )), toInt32(id))
WHERE id IN (0, 1, 0x7fffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt32(id) AS id
        FROM data
    )), toUInt32(id))
WHERE id IN (0, 1, 0x7fffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt32(id) AS id
        FROM data
    )), toUInt32(id))
WHERE id IN (0, 1, 0x7fffffff, 0x80000000, 0xffffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt32(id) AS id
        FROM data
    )), toInt32(id))
WHERE id IN (0, 1, 0x7fffffff, 0x80000000, 0xffffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt64(id) AS id
        FROM data
    )), toInt64(id))
WHERE id IN (0, 1, 0x7fffffffffffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt64(id) AS id
        FROM data
    )), toUInt64(id))
WHERE id IN (0, 1, 0x7fffffffffffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt64(id) AS id
        FROM data
    )), toUInt64(id))
WHERE id IN (0, 1, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toUInt64(id) AS id
        FROM data
    )), toInt64(id))
WHERE id IN (0, 1, 0x7fffffffffffffff, 0x8000000000000000, 0xffffffffffffffff)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT DISTINCT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt16(id) AS id
        FROM data
    )), toInt8(id) % 255)
WHERE id IN (-1)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT DISTINCT
    _shard_num,
    *
FROM remote('127.{1..4}', view((
        SELECT toInt16(id) AS id
        FROM data
    )), toUInt8(id) % 255)
WHERE id IN (-1)
ORDER BY
    _shard_num ASC,
    id ASC;

SELECT *
FROM remote('127.{1..4}', view((
        SELECT number AS id
        FROM numbers(0)
    )), bitAnd(murmurHash3_32(id), 2147483647))
WHERE id IN (2, 3);

SELECT *
FROM remote('127.{1..8}', view((
        SELECT number AS id
        FROM numbers(0)
    )), bitAnd(murmurHash3_32(id), 2147483647))
WHERE id IN (2, 3);