CREATE TABLE `array`
(
    arr Array(Nullable(Float64))
)
ENGINE = Memory;

SELECT *
FROM `array`
WHERE arr > [12.2];

SELECT *
FROM `array`
WHERE arr > [null, 12.2];

SELECT *
FROM `array`
WHERE arr > [null, 12];