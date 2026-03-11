SELECT
    tuple(x, y) AS key,
    dictGet('01760_db.dict_array', 'name', key),
    dictGet('01760_db.dict_array', 'value', key),
    dictGet('01760_db.dict_array', 'value_nullable', key)
FROM `01760_db`.points
ORDER BY
    x ASC,
    y ASC;

SELECT
    tuple(x, y) AS key,
    dictGetOrDefault('01760_db.dict_array', 'name', key, 'DefaultName'),
    dictGetOrDefault('01760_db.dict_array', 'value', key, 30),
    dictGetOrDefault('01760_db.dict_array', 'value_nullable', key, 40)
FROM `01760_db`.points
ORDER BY
    x ASC,
    y ASC;

SELECT
    tuple(x, y) AS key,
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key)
FROM `01760_db`.points
ORDER BY
    x ASC,
    y ASC;

SELECT
    tuple(nan, inf) AS key,
    dictGet('01760_db.dict_array', 'name', key);

SELECT
    tuple(nan, nan) AS key,
    dictGet('01760_db.dict_array', 'name', key);

SELECT
    tuple(inf, nan) AS key,
    dictGet('01760_db.dict_array', 'name', key);

SELECT
    tuple(inf, inf) AS key,
    dictGet('01760_db.dict_array', 'name', key);