select c2, groupArray(c2) over (partition by c1 order by c2  asc collate 'zh_Hans_CN') as res from test_window_collate order by c2  asc collate 'zh_Hans_CN';
