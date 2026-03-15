CREATE TABLE t1 (`id` Int32, `key` String) ENGINE = Memory;
CREATE TABLE t2 (`id` Int32, `key` String) ENGINE = Memory;
SELECT * FROM t1 ANY INNER JOIN t2 ON ((NULL = t1.key) = t2.id) AND (('' = t1.key) = t2.id);
