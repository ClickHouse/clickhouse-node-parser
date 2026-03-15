SET allow_suspicious_low_cardinality_types = 1, allow_experimental_dynamic_type = 1;
CREATE TABLE t0 (c0 LowCardinality(Nullable(Int))) ENGINE = Memory();
SELECT c0::Dynamic FROM t0;
SELECT c0 FROM t0;
