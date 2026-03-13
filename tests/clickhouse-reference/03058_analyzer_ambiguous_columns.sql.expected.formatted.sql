SELECT
    id,
    animal_name,
    a.animal_key,
    color_name,
    color_key
FROM
    fact AS a
LEFT JOIN (
        SELECT
            toInt64(animal_key) AS animal_key,
            animal_name
        FROM animals
    ) AS b
    ON (a.animal_key = b.animal_key)
LEFT JOIN (
        SELECT
            toInt64(color_key) AS color_key,
            color_name
        FROM colors
    ) AS c
    ON (a.color_key = c.color_key); -- { serverError AMBIGUOUS_IDENTIFIER }

SELECT
    id,
    animal_name,
    animal_key,
    color_name,
    color_key
FROM
    fact AS a
LEFT JOIN (
        SELECT
            toInt64(animal_key) AS animal_key,
            animal_name
        FROM animals
    ) AS b
    ON (a.animal_key = b.animal_key)
LEFT JOIN (
        SELECT
            toInt64(color_key) AS color_key,
            color_name
        FROM colors
    ) AS c
    ON (a.color_key = c.color_key); -- { serverError AMBIGUOUS_IDENTIFIER }