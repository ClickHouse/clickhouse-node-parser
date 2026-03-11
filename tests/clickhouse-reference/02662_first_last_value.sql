-- first value
select first_value(b) from test;
select first_value(b) ignore nulls from test;
select first_value(b) respect nulls from test;
-- last value
select last_value(b) from test;
select last_value(b) ignore nulls from test;
select last_value(b) respect nulls from test;
