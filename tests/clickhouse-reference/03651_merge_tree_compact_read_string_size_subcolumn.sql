CREATE TABLE t0 (c0 String) ENGINE = MergeTree() ORDER BY (c0) SETTINGS write_marks_for_substreams_in_compact_parts = 0;
SELECT c0.size FROM t0;
