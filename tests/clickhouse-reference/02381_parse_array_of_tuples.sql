CREATE TABLE t_parse_tuples
(
    id UInt32,
    arr Array(Array(Tuple(c1 Int32, c2 UInt8)))
)
ENGINE = Memory;
SELECT * FROM t_parse_tuples ORDER BY id;
