SELECT count(x) FROM tdm__fuzz_23 WHERE toDate(x) < toDate(now(), 'Asia/Istanbul') SETTINGS max_rows_to_read = 1;
