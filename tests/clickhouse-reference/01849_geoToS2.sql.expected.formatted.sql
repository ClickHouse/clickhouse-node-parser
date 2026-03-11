SELECT
    s2ToGeo(s2_index),
    geoToS2(longitude, latitude)
FROM s2_indexes
ORDER BY s2_index ASC;

SELECT
    `first`,
    second,
    result
FROM (
        SELECT
            s2ToGeo(geoToS2(longitude, latitude)) AS output_geo,
            tuple(roundBankers(longitude, 5), roundBankers(latitude, 5)) AS `first`,
            tuple(roundBankers(output_geo.1, 5), roundBankers(output_geo.2, 5)) AS second,
            if(`first` = second, 'ok', 'fail') AS result
        FROM s2_indexes
        ORDER BY s2_index ASC
    );

SELECT s2ToGeo(toUInt64(-1));

SELECT s2ToGeo(nan);

SELECT geoToS2(toFloat64(toUInt64(-1)), toFloat64(toUInt64(-1)));

SELECT geoToS2(nan, nan);

SELECT geoToS2(-inf, 1.1754943508222875e-38);