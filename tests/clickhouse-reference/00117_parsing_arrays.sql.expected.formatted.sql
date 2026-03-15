CREATE TABLE null_00117
(
    a Array(UInt64),
    b Array(String),
    c Array(Array(Date))
)
ENGINE = Memory;

SELECT
    a,
    b,
    c
FROM null_00117
ORDER BY
    a ASC,
    b ASC,
    c ASC;