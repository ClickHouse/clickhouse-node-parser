select sum(key) from projection_without_key settings optimize_use_projections = 1;
select sum(key) from projection_without_key settings optimize_use_projections = 0;
