-- Tags: no-ordinary-database, no-encrypted-storage

drop table if exists mt1;
drop table if exists mt2;
create table mt1 (n Int64) engine=MergeTree order by n;
create table mt2 (n Int64) engine=MergeTree order by n;
insert into mt1 values (1);
insert into mt2 values (10);
select 'commit', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
insert into mt1 values (2);
insert into mt2 values (20);
select 'rollback', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'no nested', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
insert into mt1 values (3);
insert into mt2 values (30);
select 'on exception before start', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
-- rollback on exception before start
select functionThatDoesNotExist(); -- { serverError UNKNOWN_FUNCTION }
insert into mt1 values (4);
insert into mt2 values (40);
select 'on exception while processing', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
-- rollback on exception while processing
select throwIf(100 < number) from numbers(1000); -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }
insert into mt1 values (5); -- { serverError INVALID_TRANSACTION }
insert into mt2 values (50); -- { serverError INVALID_TRANSACTION }
select 1; -- { serverError INVALID_TRANSACTION }
insert into mt1 values (6);
insert into mt2 values (60);
select 'on session close', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
insert into mt1 values (7);
insert into mt2 values (70);
select 'readonly', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'snapshot', count(), sum(n) from mt1;
set transaction snapshot 1;
select 'snapshot1', count(), sum(n) from mt1;
set transaction snapshot 3;
set throw_on_unsupported_query_inside_transaction=0;
select 'snapshot3', count() = (select count() from system.parts where database=currentDatabase() and table='mt1' and _state in ('Active', 'Outdated')) from mt1;
set throw_on_unsupported_query_inside_transaction=1;
set transaction snapshot 1000000000000000;
select 'snapshot100500', count(), sum(n) from mt1;
set transaction snapshot 5; -- { serverError INVALID_TRANSACTION }
create table m (n int) engine=Memory; -- { serverError NOT_IMPLEMENTED }
insert into m values (1); -- { serverError NOT_IMPLEMENTED }
select * from m; -- { serverError INVALID_TRANSACTION }
drop table m;
drop table mt1;
drop table mt2;
