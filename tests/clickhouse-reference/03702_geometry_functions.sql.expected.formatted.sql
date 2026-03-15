CREATE TABLE IF NOT EXISTS geo_dst
(
    id Int32,
    geom Geometry
)
ENGINE = Memory();

CREATE TABLE IF NOT EXISTS geo
(
    geom String,
    id Int
)
ENGINE = Memory();

SELECT perimeterCartesian(geom)
FROM geo_dst
ORDER BY id ASC;

SELECT areaCartesian(geom)
FROM geo_dst
ORDER BY id ASC;

CREATE TABLE variant_table
(
    id Int32,
    data Variant(UInt64, String, Array(String), Tuple(String, UInt32))
)
ENGINE = Memory();

SELECT perimeterCartesian(data)
FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT areaCartesian(data)
FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT perimeterCartesian(id, data)
FROM variant_table; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT areaCartesian(id, data)
FROM variant_table; -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }

SELECT perimeterCartesian(id)
FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }

SELECT areaCartesian(id)
FROM variant_table; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }