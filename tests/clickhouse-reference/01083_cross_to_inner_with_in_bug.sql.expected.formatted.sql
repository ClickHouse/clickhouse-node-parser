CREATE TABLE ax
(
    A Int64,
    B Int64
)
ENGINE = Memory;

CREATE TABLE bx
(
    A Int64
)
ENGINE = Memory;

SELECT *
FROM
    bx
CROSS JOIN ax
WHERE ax.A = bx.A
    AND ax.B IN (1, 2);