select count(x) from tbulk where g = 1 and k = 1 settings secondary_indices_enable_bulk_filtering=0;
select count(x) from tbulk where g = 1 and k = 1 settings secondary_indices_enable_bulk_filtering=1;
