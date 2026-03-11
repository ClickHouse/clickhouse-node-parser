SELECT a
FROM
    `03006_buffer_overflow_l`
RIGHT JOIN `03006_buffer_overflow_r`
    USING (a)
ORDER BY a ASC
FORMAT Null;