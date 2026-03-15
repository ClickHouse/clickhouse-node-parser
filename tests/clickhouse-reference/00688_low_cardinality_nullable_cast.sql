set allow_suspicious_low_cardinality_types = 1;
SELECT CAST(NULL, 'LowCardinality(Nullable(Int8))');
CREATE TABLE lc_null_int8_defnull (val LowCardinality(Nullable(Int8)) DEFAULT NULL) ENGINE = MergeTree order by tuple();
select * from lc_null_int8_defnull values;
select * from lc_null_int8_defnull order by val;
