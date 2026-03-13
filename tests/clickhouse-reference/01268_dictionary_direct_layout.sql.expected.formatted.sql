SELECT dictGetHierarchy('db_01268.dict2', toUInt64(3));

SELECT dictHas('db_01268.dict2', toUInt64(3));

SELECT dictHas('db_01268.dict2', toUInt64(45));

SELECT dictIsIn('db_01268.dict2', toUInt64(3), toUInt64(1));

SELECT dictIsIn('db_01268.dict2', toUInt64(1), toUInt64(3));

SELECT dictGetUInt64('db_01268.dict2', 'parent_region', toUInt64(3));

SELECT dictGetUInt64('db_01268.dict2', 'parent_region', toUInt64(99));

SELECT dictGetFloat32('db_01268.dict3', 'parent_region', toUInt64(3));

SELECT dictGetFloat32('db_01268.dict3', 'parent_region', toUInt64(2));

SELECT dictGetFloat32('db_01268.dict3', 'parent_region', toUInt64(1));

SELECT dictGetString('db_01268.dict2', 'region_name', toUInt64(5));

SELECT dictGetString('db_01268.dict2', 'region_name', toUInt64(4));

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(100), 'NONE');

SELECT
    number + 1,
    dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(number + 1), 'NONE') AS chars
FROM numbers(10);

SELECT
    number + 1,
    dictGetFloat32OrDefault('db_01268.dict3', 'parent_region', toUInt64(number + 1), toFloat32(0)) AS chars
FROM numbers(10);

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(1), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(2), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(3), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(4), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(5), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(6), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(7), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(8), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(9), 'NONE');

SELECT dictGetStringOrDefault('db_01268.dict2', 'region_name', toUInt64(10), 'NONE');

SELECT dictGetUInt64('db_01268.dict1', 'second_column', toUInt64(100500)); -- { serverError TOO_MANY_ROWS_OR_BYTES }