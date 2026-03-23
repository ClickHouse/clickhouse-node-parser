-- Tags: no-asan
-- no-asan: the flaky check complains that the test sometimes runs > 60 sec on asan builds

set allow_suspicious_codecs=1;
create table bug_delta_gorilla
(value_bug UInt64 codec (Delta, Gorilla))
engine = MergeTree
order by tuple() SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi'
as (select 0 from numbers(20000000));
select count(*)
from bug_delta_gorilla
where 0 <> value_bug;
create table bug_delta_gorilla (val UInt64 codec (Delta, Gorilla))
engine = MergeTree
order by val SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
insert into bug_delta_gorilla values (0)(1)(3);
select * from bug_delta_gorilla;
