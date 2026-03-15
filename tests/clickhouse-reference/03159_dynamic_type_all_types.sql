-- Tags: no-random-settings

SET allow_experimental_dynamic_type=1;
SET allow_experimental_variant_type=1;
SET allow_suspicious_low_cardinality_types=1;
SET allow_suspicious_types_in_order_by=1;
CREATE TABLE t (d Dynamic(max_types=254)) ENGINE = Memory;
SELECT dynamicType(d), d FROM t ORDER BY substring(dynamicType(d),1,1), length(dynamicType(d)), d;
CREATE TABLE t2 (d Dynamic(max_types=254)) ENGINE = Memory;
SELECT dynamicType(d), d FROM t2 ORDER BY substring(dynamicType(d),1,1), length(dynamicType(d)), d;
SELECT uniqExact(dynamicType(d)) t_ FROM t;
SELECT uniqExact(dynamicType(d)) t_ FROM t2;
