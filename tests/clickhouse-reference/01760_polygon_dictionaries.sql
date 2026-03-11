SELECT tuple(x, y) as key,
    dictGet('01760_db.dict_array', 'name', key),
    dictGet('01760_db.dict_array', 'value', key),
    dictGet('01760_db.dict_array', 'value_nullable', key)
FROM 01760_db.points
ORDER BY x, y;
SELECT tuple(x, y) as key,
    dictGetOrDefault('01760_db.dict_array', 'name', key, 'DefaultName'),
    dictGetOrDefault('01760_db.dict_array', 'value', key, 30),
    dictGetOrDefault('01760_db.dict_array', 'value_nullable', key, 40)
FROM 01760_db.points
ORDER BY x, y;
SELECT tuple(x, y) as key,
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key),
    dictHas('01760_db.dict_array', key)
FROM 01760_db.points
ORDER BY x, y;
SELECT tuple(nan, inf) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
SELECT tuple(nan, nan) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
SELECT tuple(inf, nan) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
SELECT tuple(inf, inf) as key, dictGet('01760_db.dict_array', 'name', key); --{serverError BAD_ARGUMENTS}
