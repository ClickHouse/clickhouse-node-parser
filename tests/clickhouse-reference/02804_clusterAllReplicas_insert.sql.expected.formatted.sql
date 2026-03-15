CREATE TABLE data
(
    key Int
)
ENGINE = Memory();

SELECT *
FROM data
ORDER BY key ASC;