SET flatten_nested = 0;

SET use_uncompressed_cache = 0;

SET local_filesystem_read_method = 'pread';

CREATE TABLE nested
(
    col1 Nested(a UInt32, s String),
    col2 Nested(a UInt32, n Nested(s String, b UInt32)),
    col3 Nested(n1 Nested(a UInt32, b UInt32), n2 Nested(s String, t String))
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO nested;

INSERT INTO nested;

SELECT *
FROM nested;

SELECT
    col1.a,
    col1.s
FROM nested;

SELECT
    col2.a,
    col2.n,
    col2.n.s,
    col2.n.b
FROM nested;

SELECT
    col3.n1,
    col3.n2,
    col3.n1.a,
    col3.n1.b,
    col3.n2.s,
    col3.n2.t
FROM nested;

SELECT col1.a
FROM nested
FORMAT Null;

SELECT ProfileEvents['FileOpen'] - ProfileEvents['CreatedReadBufferDirectIOFailed']
FROM `system`.query_log
WHERE (type = 'QueryFinish')
    AND (like(lower(query), lower('SELECT col1.a FROM %nested%')))
    AND event_date >= yesterday()
    AND current_database = currentDatabase();

SELECT col3.n2.s
FROM nested
FORMAT Null;

SELECT ProfileEvents['FileOpen'] - ProfileEvents['CreatedReadBufferDirectIOFailed']
FROM `system`.query_log
WHERE (type = 'QueryFinish')
    AND (like(lower(query), lower('SELECT col3.n2.s FROM %nested%')))
    AND event_date >= yesterday()
    AND current_database = currentDatabase();

CREATE TABLE nested
(
    id UInt32,
    col1 Nested(a UInt32, n Nested(s String, b UInt32))
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO nested SELECT
    number,
    arrayMap(x -> (x, arrayMap(y -> (toString(y * x), y + x), range(number % 17))), range(number % 19))
FROM numbers(100000);

SELECT
    id % 10,
    sum(length(col1)),
    sumArray(arrayMap(x -> length(x), col1.n.b))
FROM nested
GROUP BY id % 10;

SELECT
    arraySum(col1.a),
    arrayMap(x -> x * x * 2, col1.a)
FROM nested
ORDER BY id ASC
LIMIT 5;

SELECT untuple(arrayJoin(arrayJoin(col1.n)))
FROM nested
ORDER BY id ASC
LIMIT 10
OFFSET 10;