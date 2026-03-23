CREATE TABLE t0 (c0 JSON) ENGINE = MergeTree() ORDER BY (c0); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
INSERT INTO TABLE t0 (c0) VALUES ('{"c1":1}'), ('{"c0":1}'); -- { serverError UNKNOWN_TABLE }
SELECT '---';
CREATE TABLE t1 (c0 JSON) ENGINE = MergeTree() ORDER BY tuple() PARTITION BY (c0); -- { serverError DATA_TYPE_CANNOT_BE_USED_IN_KEY }
INSERT INTO TABLE t1 (c0) VALUES ('{"c0":[null,true]}'); -- { serverError UNKNOWN_TABLE }
SELECT c0 FROM t1 ORDER BY c0; -- { serverError UNKNOWN_TABLE }
