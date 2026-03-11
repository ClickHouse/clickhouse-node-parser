SELECT uniq(b) * any(_sample_factor) FROM t_sample_factor SAMPLE 200000;
SELECT uniq(b) * any(_sample_factor) FROM t_sample_factor SAMPLE 200000 WHERE a < -1;
SELECT uniq(b) * any(_sample_factor) FROM t_sample_factor SAMPLE 200000 PREWHERE a < -1;
