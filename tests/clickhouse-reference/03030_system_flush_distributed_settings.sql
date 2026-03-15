create table ephemeral (key Int, value Int) engine=Null();
create table dist_in as ephemeral engine=Distributed(test_shard_localhost, currentDatabase(), ephemeral, key) settings background_insert_batch=1;
create table data (key Int, uniq_values Int) engine=TinyLog();
create materialized view mv to data as select key, uniqExact(value::String) uniq_values from ephemeral group by key;
create table dist_out as data engine=Distributed(test_shard_localhost, currentDatabase(), data);
set prefer_localhost_replica=0;
SET optimize_trivial_insert_select = 1;
select count() from dist_out;
