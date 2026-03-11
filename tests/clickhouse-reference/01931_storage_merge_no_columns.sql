select 1 from merge(currentDatabase(), '^data$') prewhere _table in (NULL); -- { serverError ILLEGAL_PREWHERE }
select 1 from merge(currentDatabase(), '^data$') where _table in (NULL);
