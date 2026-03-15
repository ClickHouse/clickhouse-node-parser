CREATE TABLE lc_nullable_string(`c1` LowCardinality(Nullable(String)) DEFAULT CAST(NULL, 'LowCardinality(Nullable(String))')) 
ENGINE = Memory;
SELECT * FROM lc_nullable_string ORDER BY c1;
