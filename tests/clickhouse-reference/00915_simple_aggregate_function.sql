select * from simple;
select * from simple final order by id;
select toTypeName(val) from simple limit 1;
select toTypeName(nullable_str),toTypeName(nullable_str_respect_nulls),toTypeName(low_str),toTypeName(ip),toTypeName(status), toTypeName(tup), toTypeName(tup_min), toTypeName(tup_max), toTypeName(arr), toTypeName(uniq_arr), toTypeName(map_uniq_arr) from simple limit 1;
select 'with_overflow', * from with_overflow;
