SELECT count()
FROM data_02021
PREWHERE 1
    OR ignore(key)
WHERE ignore(key) = 0;