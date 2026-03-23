CREATE TABLE not_partitioned
(
    x UInt8
)
ENGINE = MergeTree
ORDER BY x;

INSERT INTO not_partitioned;

INSERT INTO not_partitioned;

SELECT
    `partition`,
    name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'not_partitioned'
    AND active
ORDER BY name ASC;

SELECT sum(x)
FROM not_partitioned;

SELECT `system`.detached_parts.* EXCEPT (bytes_on_disk, path, disk, modification_time)
FROM `system`.detached_parts
WHERE database = currentDatabase()
    AND table = 'not_partitioned';

CREATE TABLE partitioned_by_week
(
    d Date,
    x UInt8
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY toMonday(d);

-- 2000-01-03 belongs to a different week than 2000-01-01 and 2000-01-02
INSERT INTO partitioned_by_week;

INSERT INTO partitioned_by_week;

SELECT
    `partition`,
    name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'partitioned_by_week'
    AND active
ORDER BY name ASC;

SELECT sum(x)
FROM partitioned_by_week;

CREATE TABLE partitioned_by_tuple
(
    d Date,
    x UInt8,
    y UInt8
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY (d, x);

INSERT INTO partitioned_by_tuple;

INSERT INTO partitioned_by_tuple;

SELECT
    `partition`,
    name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'partitioned_by_tuple'
    AND active
ORDER BY name ASC;

SELECT sum(y)
FROM partitioned_by_tuple;

CREATE TABLE partitioned_by_string
(
    s String,
    x UInt8
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY s;

INSERT INTO partitioned_by_string;

INSERT INTO partitioned_by_string;

SELECT
    `partition`,
    name
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'partitioned_by_string'
    AND active
ORDER BY name ASC;

SELECT sum(x)
FROM partitioned_by_string;

CREATE TABLE without_fixed_size_columns
(
    s String
)
ENGINE = MergeTree
ORDER BY s
PARTITION BY length(s);

INSERT INTO without_fixed_size_columns;

SELECT
    `partition`,
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'without_fixed_size_columns'
    AND active
ORDER BY name ASC;

SELECT *
FROM without_fixed_size_columns
ORDER BY s ASC;