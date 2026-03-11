SELECT
    rows,
    statistics,
    estimates.cardinality,
    estimates.min,
    estimates.max,
FROM system.parts_columns
WHERE table = 't_long_statistics_name'
    AND database = currentDatabase()
    AND table = 't_long_statistics_name'
    AND column = '一个非常非常非常非常非常非常非常非常非常非常非常长的中文字符串';
