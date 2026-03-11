SELECT ignore(CAST((arrayMap(k -> toString(k), mapKeys(uniqMapMerge(uniq_tags_ids) AS m)), mapValues(m)), 'Map(String, UInt32)')) FROM segfault_mv;
