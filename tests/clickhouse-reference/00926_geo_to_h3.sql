select geoToH3(55.77922738, 37.63098076, 15);
select geoToH3(55.77922738, 37.63098076, 24); -- { serverError ARGUMENT_OUT_OF_BOUND }
select geoToH3(lat, lon, resolution) from table1 order by lat, lon, resolution;
select geoToH3(lat, lon, resolution) AS k from table1 order by lat, lon, k;
select lat, lon, geoToH3(lat, lon, resolution) AS k from table1 order by lat, lon, k;
select geoToH3(lat, lon, resolution) AS k, count(*) from table1 group by k order by k;
