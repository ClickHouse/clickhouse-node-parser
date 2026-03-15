CREATE TABLE IF NOT EXISTS decimal
(
    x DECIMAL(10, -2)
)
ENGINE = Memory; -- { serverError ARGUMENT_OUT_OF_BOUND }

CREATE TABLE IF NOT EXISTS decimal
(
    x DECIMAL(10, 15)
)
ENGINE = Memory; -- { serverError ARGUMENT_OUT_OF_BOUND }

CREATE TABLE IF NOT EXISTS decimal
(
    x DECIMAL(0, 0)
)
ENGINE = Memory; -- { serverError ARGUMENT_OUT_OF_BOUND }

CREATE TABLE IF NOT EXISTS decimal
(
    a DECIMAL(9,0),
    b DECIMAL(18,0),
    c DECIMAL(38,0),
    d DECIMAL(9, 9),
    e DECIMAL(18, 18),
    f DECIMAL(38, 38),
    g Decimal(9, 5),
    h decimal(18, 9),
    i deciMAL(38, 18),
    j DECIMAL(1,0)
)
ENGINE = Memory;

SELECT *
FROM decimal
ORDER BY
    a ASC,
    b ASC,
    c ASC,
    d ASC,
    e ASC,
    f ASC,
    g ASC,
    h ASC,
    i ASC,
    j ASC;