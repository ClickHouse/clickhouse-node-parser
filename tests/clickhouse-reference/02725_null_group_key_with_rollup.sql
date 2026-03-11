select c1, count(*) from group_by_null_key group by c1 WITH TOTALS;
select c2, count(*) from group_by_null_key group by c2 WITH TOTALS;
select c1, count(*) from group_by_null_key group by ROLLUP(c1);
select c2, count(*) from group_by_null_key group by ROLLUP(c2);
