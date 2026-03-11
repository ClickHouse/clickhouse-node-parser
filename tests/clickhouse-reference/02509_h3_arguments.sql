-- Tags: no-fasttest

select h3ToParent(641573946153969375, 1);
select h3ToParent(641573946153969375, arrayJoin([1,2]));
SELECT geoToH3(longitude,  latitude, toUInt8(8)) AS h3Index FROM data_table ORDER BY 1;
SELECT geoToH3(longitude,  latitude, toUInt8(longitude - longitude + 8)) AS h3Index FROM data_table ORDER BY 1;
