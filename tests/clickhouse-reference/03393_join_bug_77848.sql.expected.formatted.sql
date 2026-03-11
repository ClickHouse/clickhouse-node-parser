SELECT 1
FROM
    BadTable AS i
LEFT JOIN BadJoin AS c
    ON i.id_uint = toUInt128(c.id)
WHERE equals(i.id_uint, 12);

SELECT equals(i.id_uint, 12)
FROM
    BadTable AS i
LEFT JOIN BadJoin AS c
    ON i.id_uint = toUInt128(c.id)
WHERE equals(i.id_uint, 12);