CREATE TABLE users_03236_zero
(
    uid Int16,
    name String,
    num Int16
)
ENGINE = Memory;

SELECT sum(num / toDecimal256(1000, 18))
FROM users_03236_zero;