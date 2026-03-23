SET allow_experimental_dynamic_type = 1;

SET allow_suspicious_types_in_order_by = 1;

CREATE TABLE null_table
(
    n1 UInt8,
    n2 Dynamic(max_types = 3)
)
ENGINE = Null;

CREATE TABLE to_table
(
    n1 UInt8,
    n2 Dynamic(max_types = 4)
)
ENGINE = MergeTree
ORDER BY n1;

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