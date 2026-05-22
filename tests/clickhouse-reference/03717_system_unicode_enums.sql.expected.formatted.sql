-- Tags: no-fasttest
-- ^ depends on ICU library
SELECT
    code_point,
    code_point_value,
    name,
    block
FROM `system`.unicode
WHERE numeric_type = 'Digit'
    AND block = 'Ethiopic'
ORDER BY code_point ASC;

SELECT
    code_point,
    code_point_value,
    name,
    block
FROM `system`.unicode
WHERE block = 'Emoticons'
    AND like(name, '%CRY%')
ORDER BY code_point ASC;