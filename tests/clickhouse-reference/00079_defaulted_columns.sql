drop table if exists defaulted;
create table defaulted (col1 default 0) engine=Memory;
drop table defaulted;
create table defaulted (col1 UInt32, col2 default col1 + 1, col3 materialized col1 + 2, col4 alias col1 + 3) engine=Memory;
insert into defaulted (col1) values (10);
select * from defaulted;
select col3, col4 from defaulted;
create table defaulted (col1 Int8, col2 UInt64 default (SELECT dummy+99 from system.one)) engine=Memory; --{serverError THERE_IS_NO_DEFAULT_VALUE}
set allow_deprecated_syntax_for_merge_tree=1;
create table defaulted (payload String, date materialized today(), key materialized 0 * rand()) engine=MergeTree(date, key, 8192);
insert into defaulted (payload) values ('hello clickhouse');
select *, payload_length from defaulted;
insert into defaulted (payload) values ('some string');
select *, payload_length from defaulted order by payload;
select * from defaulted order by payload;
