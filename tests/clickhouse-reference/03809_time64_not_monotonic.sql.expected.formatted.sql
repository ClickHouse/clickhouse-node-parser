-- This query previously caused "Invalid binary search result in MergeTreeSetIndex" exception
-- because the conversion from UInt64 to Time64 was incorrectly marked as monotonic.
SELECT count() > 0
FROM merge_test
WHERE x NOT IN (12345, 67890);