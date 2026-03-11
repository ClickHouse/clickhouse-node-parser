SELECT COUNT()
FROM limited_merge_table;

SELECT if(length(topK(2)(length(merged_from))) == 2, arrayMin(topK(2)(length(merged_from))) <= 3, 1)
FROM `system`.part_log
WHERE table = 'limited_merge_table'
    AND database = currentDatabase()
    AND event_type = 'MergeParts';