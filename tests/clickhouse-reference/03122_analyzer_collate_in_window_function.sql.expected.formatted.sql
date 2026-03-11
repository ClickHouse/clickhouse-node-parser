SELECT
    c2,
    groupArray(c2) OVER (PARTITION BY c1 ORDER BY c2 ASC COLLATE 'zh_Hans_CN') AS res
FROM test_window_collate
ORDER BY c2 ASC COLLATE 'zh_Hans_CN';