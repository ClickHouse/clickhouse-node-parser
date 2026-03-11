SELECT count(x)
FROM tbulk
WHERE g = 1
    AND k = 1
SETTINGS secondary_indices_enable_bulk_filtering = 0;

SELECT count(x)
FROM tbulk
WHERE g = 1
    AND k = 1
SETTINGS secondary_indices_enable_bulk_filtering = 1;