CREATE TABLE t64
(
    date16 Date,
    t_date16 Date Codec(T64, ZSTD),
    date_32 Date32,
    t_date32 Date32 Codec(T64, ZSTD)
) ENGINE MergeTree() ORDER BY tuple();
SELECT * FROM t64 ORDER BY date_32;
SELECT * FROM t64 WHERE date16 != t_date16;
SELECT * FROM t64 WHERE date_32 != t_date32;
