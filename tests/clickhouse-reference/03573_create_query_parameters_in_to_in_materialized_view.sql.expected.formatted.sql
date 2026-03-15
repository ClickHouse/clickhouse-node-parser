-- formatting
SELECT formatQuerySingleLine('create materialized view mv_kek to {db:Identifier}.{target_table:Identifier} as select * from null_kek');

SELECT formatQuerySingleLine('create materialized view mv_kek to {target_table:Identifier} as select * from null_kek');

-- table name substituion
CREATE TABLE dst_table
ENGINE = MergeTree
ORDER BY number AS
SELECT number
FROM numbers(3);

CREATE TABLE src_table AS dst_table
ENGINE = Null;

SET param_dst_table = 'dst_table';

CREATE MATERIALIZED VIEW mv_table
TO {dst_table:Identifier}
AS
SELECT *
FROM src_table;

SELECT *
FROM dst_table
ORDER BY number ASC;

CREATE TABLE dst_table
(
    number UInt32
)
ENGINE = MergeTree
ORDER BY number;

SET param_src_table = 'src_table';

CREATE MATERIALIZED VIEW mv_table
TO {dst_table:Identifier}
AS
SELECT *
FROM {src_table:Identifier}
WHERE number NOT IN (
        SELECT number
        FROM {dst_table:Identifier}
    );

SELECT *
FROM dst_table
ORDER BY number ASC;