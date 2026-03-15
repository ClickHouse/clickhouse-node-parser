CREATE TABLE h3_indexes (h3_index UInt64) ENGINE = Memory;
-- compare if the results of h3ToGeo and geoToH3 are the same

CREATE TABLE h3_geo(lat Float64, lon Float64, res UInt8) ENGINE = Memory;
SELECT result FROM (
    SELECT
        (lon, lat) AS input_geo,
        h3ToGeo(geoToH3(lon, lat, res)) AS output_geo,
        if(abs(input_geo.1 - output_geo.1) < 0.001 AND abs(input_geo.2 - output_geo.2) < 0.001, 'ok', 'fail') AS result
    FROM h3_geo
);
