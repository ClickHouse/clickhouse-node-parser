CREATE TABLE src_table AS `system`.numbers
ENGINE = Memory;

CREATE MATERIALIZED VIEW dst_mv_1
ENGINE = Memory
AS
SELECT
    *,
    (
        SELECT count()
        FROM src_table
    ) AS cnt
FROM src_table;

SELECT *
FROM dst_mv_1
ORDER BY number ASC;

CREATE TABLE dest_table
(
    Date Date,
    Id UInt64,
    Units Float32
)
ENGINE = Memory;

CREATE TABLE left_table AS dest_table;

CREATE TABLE right_table AS dest_table;

CREATE MATERIALIZED VIEW dest_table_mv
TO dest_table
AS
SELECT
    Date,
    Id,
    Units
FROM
    (
        SELECT *
        FROM left_table
    ) AS t1
INNER JOIN (
        WITH (
                SELECT DISTINCT Date
                FROM left_table
                LIMIT 1
            ) AS dt

        SELECT *
        FROM right_table
        WHERE Date = dt
    ) AS t2
    USING (Date, Id);

SELECT *
FROM dest_table
ORDER BY
    Date ASC,
    Id ASC,
    Units ASC;