SELECT *
FROM
    bx
CROSS JOIN ax
WHERE ax.A = bx.A
    AND ax.B IN (1, 2);