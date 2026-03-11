SELECT
    a,
    c + toInt32(1),
    ((c + toInt32(1))) * 2
FROM prewhere_alias
PREWHERE ((c + toInt32(1))) * 2 = 6;