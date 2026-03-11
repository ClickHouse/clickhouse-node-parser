SELECT
    IF(2, NULL, 0.00009999999747378752),
    IF(104, 1048576, NULL),
    c1.key,
    IF(1, NULL, NULL),
    c2.key
FROM
    codecTest AS c1
CROSS JOIN codecTest AS c2
WHERE ignore(IF(255, -2, NULL), arrayJoin([65537]), IF(3, 1024, 9223372036854775807))
    AND IF(NULL, 256, NULL)
    AND (IF(NULL, '1048576', NULL) = (c1.key - NULL))
LIMIT 65535;

SELECT
    c1.key,
    c1.name,
    c1.ref_valueF64,
    c1.valueF64,
    c1.ref_valueF64 - c1.valueF64 AS dF64,
    '',
    c2.key,
    c2.ref_valueF64
FROM
    codecTest AS c1
CROSS JOIN codecTest AS c2
WHERE (dF64 != 3)
    AND c1.valueF64 != 0
    AND (c2.key = (c1.key - 1048576))
LIMIT 0;