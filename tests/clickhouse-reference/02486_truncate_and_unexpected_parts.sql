create table rmt (n int) engine=ReplicatedMergeTree('/test/02468/{database}', '1') order by tuple() partition by n % 2 settings replicated_max_ratio_of_wrong_parts=0, max_suspicious_broken_parts=0, max_suspicious_broken_parts_bytes=0;
create table rmt1 (n int) engine=ReplicatedMergeTree('/test/02468/{database}', '2') order by tuple() partition by n % 2 settings replicated_max_ratio_of_wrong_parts=0, max_suspicious_broken_parts=0, max_suspicious_broken_parts_bytes=0;
select *, _table from merge(currentDatabase(), '') order by  _table, (*,);
select 0;
create table rmt2 (n int) engine=ReplicatedMergeTree('/test/02468/{database}2', '1') order by tuple() partition by n % 2 settings replicated_max_ratio_of_wrong_parts=0, max_suspicious_broken_parts=0, max_suspicious_broken_parts_bytes=0;
create table rmt3 (n int) engine=ReplicatedMergeTree('/test/02468/{database}3', '1') order by tuple() settings replicated_max_ratio_of_wrong_parts=0, max_suspicious_broken_parts=0, max_suspicious_broken_parts_bytes=0;
set insert_keeper_fault_injection_probability=0;
select * from rmt3 order by n;
