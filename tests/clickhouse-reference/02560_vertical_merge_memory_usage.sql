-- should be about 4MB
select formatReadableSize(peak_memory_usage), * from system.part_log where table = 'tvm' and database = currentDatabase() and event_date >= today() - 1 and event_type = 'MergeParts' and peak_memory_usage > 100_000_000 format Vertical;
