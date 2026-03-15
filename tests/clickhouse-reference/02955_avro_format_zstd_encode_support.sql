CREATE TABLE t
(
    `n1` Int32
)
ENGINE = File(Avro)
SETTINGS output_format_avro_codec = 'zstd';
SELECT sum(n1) 
FROM t;
