SELECT
    str,
    replaceAll(str, 'o', '*') AS replaced
FROM replaceall
ORDER BY str ASC;
SELECT fs, replaceAll(fs, '\0', '*')
FROM replaceall
ORDER BY fs ASC;
