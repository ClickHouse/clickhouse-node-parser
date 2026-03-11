select 1 from tab where d > toDateTime(toDate('2000-01-01')) and p in ('a') and 1 = 1 group by d, t, p;
