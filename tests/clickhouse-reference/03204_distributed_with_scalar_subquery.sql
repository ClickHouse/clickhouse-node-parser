SELECT (
    SELECT c_k37
    FROM t_c3oollc8r
    ) > c_lfntfzg
FROM remote('127.0.0.{1,2}', currentDatabase(), t_c3oollc8r);
