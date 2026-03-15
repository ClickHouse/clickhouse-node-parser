CREATE TABLE src (x UInt8) ENGINE = Memory;
CREATE TABLE dst (x UInt8) ENGINE = Memory;
CREATE MATERIALIZED VIEW mv TO dst AS SELECT x FROM src;
SET check_referential_table_dependencies = 1;
SET check_referential_table_dependencies = 0;
