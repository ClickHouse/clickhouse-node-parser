create database test_1164_memory engine=Memory;
create table test_1164_memory.r1 (n int) engine=ReplicatedMergeTree('/test/01164/{database}/t', '1') order by n;
create table test_1164_memory.r2 (n int) engine=ReplicatedMergeTree('/test/01164/{database}/t', '2') order by n;
