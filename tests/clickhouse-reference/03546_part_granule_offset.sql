SELECT _part_granule_offset FROM test_part_granule_offset WHERE n < 10 ORDER BY all;
SELECT _part_granule_offset, groupArraySorted(200)(n) FROM test_part_granule_offset GROUP BY _part_granule_offset ORDER BY ALL;
SELECT * FROM test_part_granule_offset WHERE _part_granule_offset % 10 = 1 ORDER BY ALL;
