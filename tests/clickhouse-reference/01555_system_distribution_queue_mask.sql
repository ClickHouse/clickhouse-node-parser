-- force data path with the user/pass in it
set use_compact_format_in_distributed_parts_names=0;
-- use async send even for localhost
set prefer_localhost_replica=0;
create table data_01555 (key Int) Engine=Null();
create table dist_01555 (key Int) Engine=Distributed(test_cluster_with_incorrect_pw, currentDatabase(), data_01555, key);
insert into dist_01555 values (1)(2);
select length(splitByChar('*', data_path)), replaceRegexpOne(data_path, '^.*/([^/]*)/' , '\\1'), extract(last_exception, 'AUTHENTICATION_FAILED'), dateDiff('s', last_exception_time, now()) < 3600 from system.distribution_queue where database = currentDatabase() and table = 'dist_01555' format CSV;
create table dist_01555 (key Int) Engine=Distributed(test_shard_localhost, currentDatabase(), data_01555, key);
select length(splitByChar('*', data_path)), replaceRegexpOne(data_path, '^.*/([^/]*)/' , '\\1') from system.distribution_queue where database = currentDatabase() and table = 'dist_01555' format CSV;
