set allow_experimental_dynamic_type = 1;
set allow_suspicious_types_in_group_by = 1;
set allow_suspicious_types_in_order_by = 1;
create table test (d Dynamic(max_types=2)) engine=Memory;
select uniqExact(d) from test;
select count(), d from test group by d order by d;
