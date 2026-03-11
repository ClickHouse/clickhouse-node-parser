SELECT * FROM merge ORDER BY _part_index, x;
SELECT count(), uniqExact(x), min(x), max(x), sum(x), sum(cityHash64(x)) FROM merge;
