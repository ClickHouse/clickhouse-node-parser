select key, groupArray(repeat('a', 200)), count() from data_01513 group by key format Null settings optimize_aggregation_in_order=0; -- { serverError MEMORY_LIMIT_EXCEEDED }
select key, groupArray(repeat('a', 200)), count() from data_01513 group by key format Null settings optimize_aggregation_in_order=1;
-- for WITH TOTALS previous groups should be kept.
select key, groupArray(repeat('a', 200)), count() from data_01513 group by key with totals format Null settings optimize_aggregation_in_order=1; -- { serverError MEMORY_LIMIT_EXCEEDED }
