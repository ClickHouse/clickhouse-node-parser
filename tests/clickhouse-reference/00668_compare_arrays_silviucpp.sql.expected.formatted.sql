CREATE TABLE `array`
(
    arr Array(Nullable(Float64))
)
ENGINE = Memory;

INSERT INTO `array` (arr);

SELECT *
FROM `array`
WHERE arr > [12.2];

SELECT *
FROM `array`
WHERE arr > [null, 12.2];

SELECT *
FROM `array`
WHERE arr > [null, 12];