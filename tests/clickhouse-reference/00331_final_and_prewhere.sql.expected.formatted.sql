SELECT *
FROM `replace`
ORDER BY
    Id ASC,
    Version ASC;

SELECT *
FROM `replace` FINAL
ORDER BY
    Id ASC,
    Version ASC;

SELECT *
FROM `replace` FINAL
WHERE Version = 0
ORDER BY
    Id ASC,
    Version ASC;