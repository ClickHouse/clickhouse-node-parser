set allow_suspicious_low_cardinality_types=1;
CREATE TABLE lc_left_aj
(
    str Array(LowCardinality(String)), 
    null_str Array(LowCardinality(Nullable(String))), 
    val Array(LowCardinality(Float64)), 
    null_val Array(LowCardinality(Nullable(Float64)))
)
ENGINE = Memory;
select *, arr from lc_left_aj left array join str as arr;
select *, arr from lc_left_aj left array join null_str as arr;
select *, arr from lc_left_aj left array join val as arr;
select *, arr from lc_left_aj left array join null_val as arr;
