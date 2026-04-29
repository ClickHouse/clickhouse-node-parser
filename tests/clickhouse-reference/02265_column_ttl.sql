-- Tags: replica, long

-- Regression test for possible CHECKSUM_DOESNT_MATCH due to per-column TTL bug.
-- That had been fixed in https://github.com/ClickHouse/ClickHouse/pull/35820

drop table if exists ttl_02265;
drop table if exists ttl_02265_r2;
-- The bug is appears only for Wide part.
create table ttl_02265    (date Date, key Int, value String TTL date + interval 1 month) engine=ReplicatedMergeTree('/clickhouse/tables/{database}/ttl_02265', 'r1') order by key partition by date settings min_bytes_for_wide_part=0, min_bytes_for_full_part_storage=0;
create table ttl_02265_r2 (date Date, key Int, value String TTL date + interval 1 month) engine=ReplicatedMergeTree('/clickhouse/tables/{database}/ttl_02265', 'r2') order by key partition by date settings min_bytes_for_wide_part=0, min_bytes_for_full_part_storage=0;
-- after, 20100101_0_0_0 will have ttl.txt and value.bin
insert into ttl_02265 values ('2010-01-01', 2010, 'foo');
-- after, 20100101_0_0_1 will not have neither ttl.txt nor value.bin
optimize table ttl_02265 final;
system sync replica ttl_02265 STRICT;
system sync replica ttl_02265_r2 STRICT;
-- after detach/attach it will not have TTL in-memory, and will not have ttl.txt
detach table ttl_02265;
attach table ttl_02265;
system flush logs part_log;
select * from system.part_log where database = currentDatabase() and table like 'ttl_02265%' and error != 0 and errorCodeToName(error) != 'NO_REPLICA_HAS_PART';
