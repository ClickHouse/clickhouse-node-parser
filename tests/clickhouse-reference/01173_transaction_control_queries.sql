select 'commit', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'rollback', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'no nested', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'on exception before start', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
-- rollback on exception before start
select functionThatDoesNotExist(); -- { serverError UNKNOWN_FUNCTION }
select 'on exception while processing', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
-- rollback on exception while processing
select throwIf(100 < number) from numbers(1000); -- { serverError FUNCTION_THROW_IF_VALUE_IS_NON_ZERO }
select 1; -- { serverError INVALID_TRANSACTION }
select 'on session close', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'readonly', arraySort(groupArray(n)) from (select n from mt1 union all select * from mt2);
select 'snapshot', count(), sum(n) from mt1;
select 'snapshot1', count(), sum(n) from mt1;
select 'snapshot3', count() = (select count() from system.parts where database=currentDatabase() and table='mt1' and _state in ('Active', 'Outdated')) from mt1;
select 'snapshot100500', count(), sum(n) from mt1;
select * from m; -- { serverError INVALID_TRANSACTION }
