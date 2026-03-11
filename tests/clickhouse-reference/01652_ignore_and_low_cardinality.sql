SELECT ignore(10, ignore(*), ignore(ignore(-2, 1025, *)), NULL, *), * FROM lc_null_int8_defnull AS values;
SELECT ignore(toLowCardinality(1), toLowCardinality(2), 3);
