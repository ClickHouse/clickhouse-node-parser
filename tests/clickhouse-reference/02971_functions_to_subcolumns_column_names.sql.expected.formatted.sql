DROP TABLE IF EXISTS t_column_names;

CREATE TABLE t_column_names
(
    arr Array(UInt64),
    n Nullable(String)
)
ENGINE = Memory;

INSERT INTO t_column_names;

SET optimize_functions_to_subcolumns = 1;

SET enable_analyzer = 1;

SELECT
    length(arr),
    isNull(n)
FROM t_column_names
FORMAT JSONEachRow;

DROP TABLE t_column_names;