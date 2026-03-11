SELECT * FROM t_03209 WHERE a IN toDecimal32('33.3000', 4) SETTINGS allow_experimental_parallel_reading_from_replicas=0;
SELECT * FROM t_03209 WHERE a IN toDecimal32('33.3000', 4) SETTINGS allow_experimental_parallel_reading_from_replicas=1;
