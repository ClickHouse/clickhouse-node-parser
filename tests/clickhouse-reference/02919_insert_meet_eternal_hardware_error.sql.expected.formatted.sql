-- All 3 commits have been written correctly. The unknown status is ok (since it failed after the operation)
SELECT arraySort(groupArray(KeyID))
FROM t_hardware_error;