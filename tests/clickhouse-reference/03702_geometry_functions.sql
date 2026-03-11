SELECT perimeterCartesian(geom) FROM geo_dst ORDER BY id;
SELECT areaCartesian(geom) FROM geo_dst ORDER BY id;
SELECT perimeterCartesian(data) FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT areaCartesian(data) FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT perimeterCartesian(id, data) FROM variant_table; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT areaCartesian(id, data) FROM variant_table; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
SELECT perimeterCartesian(id) FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT areaCartesian(id) FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
