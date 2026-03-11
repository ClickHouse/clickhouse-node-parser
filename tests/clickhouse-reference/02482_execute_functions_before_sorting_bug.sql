select x + 1e10 from test order by 1e10, x;
select x + (1e10 + 1e20) from test order by (1e10 + 1e20), x;
select x + (pow(2, 2) + pow(3, 2)) from test order by (pow(2,2) + pow(3, 2)), x;
