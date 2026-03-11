select x from (with 1 as x select x union all with 2 as x select x) order by x;
