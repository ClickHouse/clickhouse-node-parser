CREATE TABLE null_table
(
    number UInt64
)
ENGINE = Null;

CREATE VIEW number_view
AS
SELECT *
FROM numbers(10) AS tb;

CREATE MATERIALIZED VIEW null_mv
ENGINE = Log
AS
SELECT *
FROM
    null_table
LEFT JOIN number_view AS tb
    USING (number);

CREATE TABLE null_table_buffer
(
    number UInt64
)
ENGINE = Buffer(currentDatabase(), null_table, 1, 1, 1, 100, 200, 10000, 20000);

INSERT INTO null_table_buffer;

SELECT sleep(1)
FORMAT Null;

-- Insert about should've landed into `null_mv`
SELECT count()
FROM null_mv;