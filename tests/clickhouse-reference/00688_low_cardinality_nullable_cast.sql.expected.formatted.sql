SELECT CAST(NULL, 'LowCardinality(Nullable(Int8))');

SELECT *
FROM lc_null_int8_defnull AS values;

SELECT *
FROM lc_null_int8_defnull
ORDER BY val ASC;