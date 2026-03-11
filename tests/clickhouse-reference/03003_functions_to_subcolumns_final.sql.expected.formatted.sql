SELECT length(arr)
FROM t_length_1
WHERE length(arr) IN (
        SELECT arr_length
        FROM t_length_2
    );

SELECT length(arr)
FROM t_length_1
WHERE length(arr) IN (
        SELECT arr_length
        FROM t_length_2 FINAL
    );

SELECT length(arr)
FROM t_length_1 FINAL
WHERE length(arr) IN (
        SELECT arr_length
        FROM t_length_2 FINAL
    );