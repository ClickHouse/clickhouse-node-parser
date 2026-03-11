SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 DESC LIMIT 5 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 DESC LIMIT 20 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 WHERE v2 > 100000 ORDER BY v1 DESC LIMIT 10 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 ASC LIMIT 5 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 ASC LIMIT 20 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 WHERE v2 > 100000 ORDER BY v1 ASC LIMIT 10 SETTINGS use_top_k_dynamic_filtering=1;
