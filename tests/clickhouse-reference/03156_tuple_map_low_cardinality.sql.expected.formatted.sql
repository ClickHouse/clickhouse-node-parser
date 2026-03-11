SELECT count()
FROM t_map_lc
WHERE NOT ignore(*, mapKeys(t.m));

SELECT count()
FROM t_map_lc
WHERE NOT ignore(*, t.m.keys);

SELECT count()
FROM t_map_lc
WHERE NOT ignore(*, t.m.values);

SELECT *
FROM t_map_lc
WHERE mapContains(t.m, 'not_existing_key_1337');