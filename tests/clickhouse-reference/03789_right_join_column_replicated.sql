SELECT z1.value
FROM location_tags AS z2
RIGHT JOIN (
    SELECT
        l.city_id AS lcity_id,
        z1.value AS value
    FROM location_tags AS z1
    RIGHT JOIN locations AS l ON z1.location_id = l.location_id
) z1 ON z2.location_id = lcity_id
ORDER BY 1;
