-- Tags: no-fasttest
SELECT h3ToParent(641573946153969375, 1);

SELECT h3ToParent(641573946153969375, arrayJoin([1,2]));

SELECT geoToH3(longitude, latitude, toUInt8(8)) AS h3Index
FROM data_table
ORDER BY 1 ASC;

SELECT geoToH3(longitude, latitude, toUInt8(longitude - longitude + 8)) AS h3Index
FROM data_table
ORDER BY 1 ASC;