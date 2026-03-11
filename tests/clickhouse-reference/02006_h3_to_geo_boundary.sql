SELECT arrayMap(p -> (round(p.1, 2), round(p.2, 2)), h3ToGeoBoundary(h3_index)) FROM h3_indexes ORDER BY h3_index;
