SELECT
    hex(uuid5_old),
    subitem
FROM badFixedStringSort
ORDER BY
    uuid5_old ASC,
    subitem ASC;