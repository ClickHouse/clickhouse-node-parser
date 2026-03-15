create table unhex_in_fix_string_table ( dt Date, s1 FixedString(20), s2 String) engine=MergeTree partition by dt order by tuple();
select unhex(s1), unhex(s2) from unhex_in_fix_string_table;
