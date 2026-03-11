SELECT COUNT() FROM limited_merge_table;
-- final optimize FINAL will merge all parts, but all previous merges must merge <= 3 parts.
-- During concurrent run only one final merge can happen, thats why we have this `if`.
SELECT if(length(topK(2)(length(merged_from))) == 2, arrayMin(topK(2)(length(merged_from))) <= 3, 1)
FROM system.part_log WHERE table = 'limited_merge_table' and database = currentDatabase() and event_type = 'MergeParts';
