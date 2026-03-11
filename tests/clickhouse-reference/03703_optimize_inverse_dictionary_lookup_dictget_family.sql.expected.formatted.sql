SELECT
    id,
    payload
FROM tab
WHERE dictGet('dictionary_all', 'name', id) = 'alpha'
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetString('dictionary_all', 'name', id) = 'alpha'
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetInt32('dictionary_all', 'i32', id) = -32
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetUInt64('dictionary_all', 'u64', id) = 64
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetFloat64('dictionary_all', 'f64', id) = 20.0
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetDate('dictionary_all', 'd', id) = toDate('2025-01-01')
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetDateTime('dictionary_all', 'dt', id) = toDateTime('2025-01-01 10:00:00')
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetUUID('dictionary_all', 'uid', id) = toUUID('00000000-0000-0000-0000-000000000001')
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetIPv4('dictionary_all', 'ip4', id) = toIPv4('192.168.0.1')
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetIPv6('dictionary_all', 'ip6', id) = toIPv6('2001:db8::1')
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE dictGetOrNull('dictionary_all', 'name', id) = 'alpha'
ORDER BY
    id ASC,
    payload ASC;

SELECT
    id,
    payload
FROM tab
WHERE isNull(dictGetOrNull('dictionary_all', 'name', id))
ORDER BY
    id ASC,
    payload ASC;