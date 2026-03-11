SELECT *
FROM table_with_lc_key
WHERE enum_key > 0
    AND like(lc_key, 'h%');

SELECT *
FROM table_with_string_key
WHERE int_key > 0
    AND like(str_key, 'h%');