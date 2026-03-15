CREATE TABLE src_table
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY a;

CREATE MATERIALIZED VIEW mv
(
    a UInt32
)
ENGINE = MergeTree
ORDER BY a
AS
SELECT a
FROM src_table;

SELECT *
FROM mv;

SET allow_experimental_alter_materialized_view_structure = 1;