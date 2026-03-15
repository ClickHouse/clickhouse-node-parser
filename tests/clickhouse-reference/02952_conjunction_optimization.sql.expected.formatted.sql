SET enable_analyzer = 1;

SET optimize_empty_string_comparisons = 0;

CREATE TABLE `02952_disjunction_optimization`
(
    a Int32,
    b String
)
ENGINE = Memory;

SELECT *
FROM `02952_disjunction_optimization`
WHERE a <> 1
    AND a <> 2
    AND a <> 4;

SELECT *
FROM `02952_disjunction_optimization`
WHERE a <> 1
    AND a <> 2
    AND a <> 4
    AND true;

SELECT *
FROM `02952_disjunction_optimization`
WHERE a <> 1
    AND a <> 2
    AND a <> 4
    AND b <> '';

SELECT *
FROM `02952_disjunction_optimization`
WHERE a <> 1
    AND a <> 2
    AND b = ''
    AND a <> 4;

SELECT *
FROM `02952_disjunction_optimization`
WHERE (a <> 1
    AND a <> 2
    AND a <> 4)
    OR b = '';