select count() from t array join (select a from t1) AS _a settings optimize_trivial_count_query=1;
