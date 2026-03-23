SET use_variant_as_common_type = 0;
DROP TABLE IF EXISTS alter_table;
CREATE TABLE alter_table (a UInt8, b Int16)
ENGINE = MergeTree
ORDER BY a;
SELECT 1;
