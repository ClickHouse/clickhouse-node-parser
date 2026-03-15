-- Tags: long, no-tsan, no-asan, no-msan, no-s3-storage
SET use_skip_indexes = 1;
SET use_skip_indexes_if_final = 1;
CREATE TABLE t_final_query_tbl(id UInt64, v UInt64, INDEX secondaryidx v TYPE minmax) ENGINE = ReplacingMergeTree ORDER BY id;
SELECT count(id) FROM t_final_query_tbl FINAL where v = 98889991 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id) FROM t_final_query_tbl FINAL where v = 88889992 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id) FROM t_final_query_tbl FINAL where v = 78889993 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id) FROM t_final_query_tbl FINAL where v = 68889994 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id) FROM t_final_query_tbl FINAL where v = 58889995 SETTINGS use_skip_indexes_if_final_exact_mode=1;
CREATE TABLE t_final_query_tbl2(id1 String, id2 UInt64, id3 DateTime, v UInt64, INDEX secondaryidx v TYPE minmax) ENGINE = ReplacingMergeTree ORDER BY (id1,id2,id3);
SELECT count(id1) FROM t_final_query_tbl2 FINAL where v = 98889991 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id1) FROM t_final_query_tbl2 FINAL where v = 88889992 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id1) FROM t_final_query_tbl2 FINAL where v = 78889993 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id1) FROM t_final_query_tbl2 FINAL where v = 68889994 SETTINGS use_skip_indexes_if_final_exact_mode=1;
SELECT count(id1) FROM t_final_query_tbl2 FINAL where v = 58889995 SETTINGS use_skip_indexes_if_final_exact_mode=1;
