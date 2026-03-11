SELECT (tupleElement(t1, 1), tupleElement(t1, 2)) FROM t_tuple_elem ORDER BY ALL;
SELECT (tupleElement(t1, 'a'), tupleElement(t1, 'b')) FROM t_tuple_elem ORDER BY ALL;
SELECT (variantElement(v, 'Array(UInt64)'), variantElement(v, 'Array(LowCardinality(String))')) FROM t_tuple_elem ORDER BY ALL;
