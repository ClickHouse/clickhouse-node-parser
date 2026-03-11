SELECT *
FROM select_final FINAL
ORDER BY
    x ASC,
    t ASC;

SELECT max(x)
FROM select_final FINAL
WHERE string = 'updated';

SELECT max(x)
FROM select_final FINAL;