SELECT sumMerge(sumCountViews) as sumCountViews FROM monthly_aggregated_data_mv;
SELECT count() FROM hourly_data;
SELECT name, engine FROM system.tables WHERE database=currentDatabase();
