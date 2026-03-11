select i from x;
select minmax_dt.1 == minmax_dt.2 from mergeTreeIndex(currentDatabase(), x, with_minmax = 1);
select (select min(dt) from x) == (select minDistinct(dt) from x);
