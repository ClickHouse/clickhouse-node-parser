set default_table_engine='ReplicatedMergeTree';
create table trunc (n int, primary key n) engine=ReplicatedMergeTree('/test/1166/{database}', '1') partition by n % 10;
select count(), sum(n) from trunc;
set default_table_engine='MergeTree';
create table trunc (n int, primary key n) partition by n % 10;
