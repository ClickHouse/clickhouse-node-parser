SET allow_experimental_variant_type = 1;
CREATE TABLE t_func_to_subcolumns_variant (id UInt64, v Variant(String, UInt64)) ENGINE = MergeTree ORDER BY id;
INSERT INTO t_func_to_subcolumns_variant VALUES (1, 'foo') (2, 111);
SET optimize_functions_to_subcolumns = 1;
SET enable_analyzer = 1;
SELECT variantElement(v, 'String') FROM t_func_to_subcolumns_variant;
