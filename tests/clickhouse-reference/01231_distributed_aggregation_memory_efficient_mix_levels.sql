select x, count() from ma_dist group by x order by x;
select arrayFilter(y -> y = x, [x]) as f from ma_dist order by f;
