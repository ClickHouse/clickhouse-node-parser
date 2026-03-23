SET join_use_nulls = 1;

SET enable_analyzer = 1;

SET join_algorithm = 'parallel_hash';

SET query_plan_join_swap_table = 0;

CREATE TABLE t_l_small
(
    id UInt32,
    value String
)
ENGINE = Memory;

CREATE TABLE t_r_small
(
    id UInt32,
    description String
)
ENGINE = Memory;

INSERT INTO t_l_small;

INSERT INTO t_r_small;

SELECT
    l.id,
    l.value,
    r.description
FROM
    t_l_small AS l
RIGHT JOIN t_r_small AS r
    ON l.id = r.id
ORDER BY
    r.id ASC,
    l.id ASC;

SELECT
    l.id,
    l.value,
    r.description
FROM
    t_l_small AS l
FULL JOIN t_r_small AS r
    ON l.id = r.id
ORDER BY
    coalesce(l.id, r.id) ASC,
    r.id ASC;

CREATE TABLE t_l_any
(
    id UInt32,
    value String
)
ENGINE = Memory;

CREATE TABLE t_r_any
(
    id UInt32,
    description String
)
ENGINE = Memory;

INSERT INTO t_l_any;

INSERT INTO t_r_any;

SELECT
    count(),
    countIf(isNull(l.value))
FROM
    t_l_any AS l
RIGHT JOIN t_r_any AS r
    ON l.id = r.id;

CREATE TABLE t_l_filter
(
    id UInt32,
    value String
)
ENGINE = Memory;

CREATE TABLE t_r_filter
(
    id UInt32,
    description String
)
ENGINE = Memory;

INSERT INTO t_l_filter;

INSERT INTO t_r_filter;

SELECT
    l.id,
    l.value,
    r.description
FROM
    t_l_filter AS l
RIGHT JOIN t_r_filter AS r
    ON l.id = r.id
    AND like(r.description, 'F%')
ORDER BY r.id ASC;

CREATE TABLE t_l_null
(
    id UInt32,
    v String
)
ENGINE = Memory;

CREATE TABLE t_r_null
(
    id Nullable(UInt32),
    d String
)
ENGINE = Memory;

INSERT INTO t_l_null;

INSERT INTO t_r_null;

SELECT
    l.id,
    l.v,
    r.d
FROM
    t_l_null AS l
RIGHT JOIN t_r_null AS r
    ON l.id = r.id
ORDER BY r.d ASC;

CREATE TABLE t_l_cmp
(
    id UInt32,
    grp UInt8,
    val String
)
ENGINE = Memory;

CREATE TABLE t_r_cmp
(
    id UInt32,
    grp UInt8,
    descr String
)
ENGINE = Memory;

INSERT INTO t_l_cmp;

INSERT INTO t_r_cmp;

SELECT
    l.id,
    l.grp,
    l.val,
    r.descr
FROM
    t_l_cmp AS l
RIGHT JOIN t_r_cmp AS r
    ON (l.id = r.id)
    AND (l.grp = r.grp)
ORDER BY
    r.id ASC,
    r.grp ASC;

SELECT
    count(),
    countIf(isNull(l.id)),
    sum(coalesce(l.id, 0)),
    sum(r.id)
FROM
    (
        SELECT number AS id
        FROM numbers(15000)
    ) AS l
RIGHT JOIN (
        SELECT number AS id
        FROM numbers(20000)
    ) AS r
    ON l.id = r.id;

SELECT
    count(),
    countIf(isNull(l.id)), -- right-only
    countIf(isNull(r.id)) -- left-only
FROM
    (
        SELECT number AS id
        FROM numbers(15000)
    ) AS l
FULL JOIN (
        SELECT number AS id
        FROM numbers(15500)
    ) AS r
    ON l.id = r.id;

SET allow_experimental_analyzer = 1;

CREATE TABLE l
(
    k UInt8,
    v UInt8
)
ENGINE = Memory;

CREATE TABLE r
(
    k UInt8,
    v UInt8
)
ENGINE = Memory;

INSERT INTO l SELECT
    toUInt8(number),
    toUInt8(number)
FROM numbers(200);

INSERT INTO r SELECT
    toUInt8(number),
    toUInt8(number)
FROM numbers(200);

SET max_threads = 8;

SET join_algorithm = 'hash';

SELECT
    'hash' AS alg,
    count() AS cnt
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'parallel_hash' AS alg,
    count() AS cnt
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'hash right-only',
    countIf(isNull(l.k))
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'parallel right-only',
    countIf(isNull(l.k))
FROM
    l
RIGHT JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'hash',
    count()
FROM
    l
FULL JOIN r
    ON l.k = r.k
    AND l.v > r.v;

SELECT
    'parallel_hash',
    count()
FROM
    l
FULL JOIN r
    ON l.k = r.k
    AND l.v > r.v;