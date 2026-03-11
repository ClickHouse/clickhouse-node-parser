SELECT perimeterCartesian(geom)
FROM geo_dst
ORDER BY id ASC;

SELECT areaCartesian(geom)
FROM geo_dst
ORDER BY id ASC;

SELECT perimeterCartesian(data)
FROM variant_table;

SELECT areaCartesian(data)
FROM variant_table;

SELECT perimeterCartesian(id, data)
FROM variant_table;

SELECT areaCartesian(id, data)
FROM variant_table;

SELECT perimeterCartesian(id)
FROM variant_table;

SELECT areaCartesian(id)
FROM variant_table;