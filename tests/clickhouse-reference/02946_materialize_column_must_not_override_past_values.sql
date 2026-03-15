SET mutations_sync = 2;
SELECT '-- Compact parts';
CREATE TABLE tab (id Int64, dflt Int64 DEFAULT 54321) ENGINE MergeTree ORDER BY id;
SELECT * FROM tab ORDER BY id;
CREATE TABLE tab (id Int64, dflt Int64 DEFAULT 54321) ENGINE MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part = 1;
CREATE TABLE tab (id Int64, dflt Nullable(Int64) DEFAULT 54321) ENGINE MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part = 1;
CREATE TABLE tab (id Int64, mtrl Int64 MATERIALIZED 54321) ENGINE MergeTree ORDER BY id;
SELECT id, mtrl FROM tab ORDER BY id;
CREATE TABLE tab (id Int64, mtrl Int64 MATERIALIZED 54321) ENGINE MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part = 1;
