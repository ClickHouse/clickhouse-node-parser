create table src( A Int64, B String, C String) Engine=MergeTree order by A SETTINGS min_bytes_for_wide_part=0;
select * from src;
create table src( A String, B String, C String) Engine=MergeTree order by A SETTINGS min_bytes_for_wide_part=0;
select '-----';
create table src( A Int64, B String, C String) Engine=ReplicatedMergeTree('/clickhouse/{database}/test/src1', '1') order by A SETTINGS min_bytes_for_wide_part=0;
create table src( A String, B String, C String) Engine=ReplicatedMergeTree('/clickhouse/{database}/test/src2', '1') order by A SETTINGS min_bytes_for_wide_part=0;
create table src( A String, B String, C String) Engine=ReplicatedMergeTree('/clickhouse/{database}/test/src3', '1') order by A SETTINGS min_bytes_for_wide_part=0;
create table src( A String, B String, C String) Engine=ReplicatedMergeTree('/clickhouse/{database}/test/src4', '1') order by A SETTINGS min_bytes_for_wide_part=0;
