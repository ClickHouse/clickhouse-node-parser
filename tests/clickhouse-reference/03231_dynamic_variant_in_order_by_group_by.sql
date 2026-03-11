select * from test order by d; -- {serverError ILLEGAL_COLUMN}
select * from test order by tuple(d); -- {serverError ILLEGAL_COLUMN}
select * from test order by array(d); -- {serverError ILLEGAL_COLUMN}
select * from test order by map('str', d); -- {serverError ILLEGAL_COLUMN}
select * from test group by d; -- {serverError ILLEGAL_COLUMN}
select * from test group by tuple(d); -- {serverError ILLEGAL_COLUMN}
select array(d) from test group by array(d); -- {serverError ILLEGAL_COLUMN}
select map('str', d) from test group by map('str', d); -- {serverError ILLEGAL_COLUMN}
select * from test group by grouping sets ((d), ('str')); -- {serverError ILLEGAL_COLUMN}
select * from test group by d order by all;
select * from test group by tuple(d) order by all;
select array(d) from test group by array(d) order by all;
select map('str', d) from test group by map('str', d) order by all;
select * from test group by grouping sets ((d), ('str')) order by all;
