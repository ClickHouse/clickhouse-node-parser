SELECT *
FROM t00156_max_execution_speed_sample_merge
WHERE sleepEachRow(0.1) == 0
FORMAT Null;

SELECT max(t) - min(t) >= 1
FROM times;