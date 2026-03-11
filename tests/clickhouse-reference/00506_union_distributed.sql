select b, sum(c) from ( select a, b, sum(c) as c from union2 where a>1 group by a,b UNION ALL select a, b, sum(c) as c from union2 where b>1 group by a, b  order by a, b) as a group by b order by b;
select b, sum(c) from ( select a, b, sum(c) as c from union1 where a>1 group by a,b UNION ALL select a, b, sum(c) as c from union2 where b>1 group by a, b order by a, b) as a group by b order by b;
select b, sum(c) from ( select a, b, sum(c) as c from union1 where a>1 group by a,b UNION ALL select a, b, sum(c) as c from union1 where b>1 group by a, b order by a, b) as a group by b order by b;
select b, sum(c) from ( select a, b, sum(c) as c from union2 where a>1 group by a,b UNION ALL select a, b, sum(c) as c from union3 where b>1 group by a, b order by a, b) as a group by b order by b;
