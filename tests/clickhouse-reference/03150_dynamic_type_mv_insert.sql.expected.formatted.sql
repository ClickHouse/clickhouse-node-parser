SET allow_experimental_dynamic_type = 1;

SET allow_suspicious_types_in_order_by = 1;

SYSTEM DROP  TABLE IF EXISTS null_table;

CREATE TABLE null_table
(
    n1 UInt8,
    n2 Dynamic(max_types = 3)
)
ENGINE = Null;

SYSTEM DROP  TABLE IF EXISTS to_table;

CREATE TABLE to_table
(
    n1 UInt8,
    n2 Dynamic(max_types = 4)
)
ENGINE = MergeTree
ORDER BY n1;

SYSTEM DROP  VIEW IF EXISTS dummy_rmv;

CREATE MATERIALIZED VIEW dummy_rmv
TO to_table
AS
SELECT *
FROM null_table;

INSERT INTO null_table (n1, n2);

SELECT
    *,
    dynamicType(n2)
FROM to_table
ORDER BY `ALL` ASC;

SYSTEM DROP  TABLE null_table;

SYSTEM DROP  VIEW dummy_rmv;

SYSTEM DROP  TABLE to_table;