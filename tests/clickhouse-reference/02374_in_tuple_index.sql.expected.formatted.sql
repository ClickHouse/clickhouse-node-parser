SELECT count()
FROM t_in_tuple_index
WHERE (PLATFORM, USER_ID) IN (('insta', '33'));

SELECT count()
FROM t_in_tuple_index
WHERE (PLATFORM, USER_ID) IN (('insta', '33'), ('insta', '22'));