CREATE TABLE `03006_buffer_overflow_l`
(
    a String,
    b Tuple(String, String)
)
ENGINE = Memory;

CREATE TABLE `03006_buffer_overflow_r`
(
    a LowCardinality(Nullable(String)),
    c Tuple(LowCardinality(String), LowCardinality(String))
)
ENGINE = Memory;

SELECT a
FROM
    `03006_buffer_overflow_l`
RIGHT JOIN `03006_buffer_overflow_r`
    USING (a)
ORDER BY a ASC
FORMAT Null;