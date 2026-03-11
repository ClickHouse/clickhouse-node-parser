select *, joinGet('test_join', 'OFFSET', TOPIC, PARTITION) from test;
select * from test any left join test_join using (TOPIC, PARTITION);
