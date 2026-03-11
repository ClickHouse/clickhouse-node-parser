SELECT
    'test',
    count(*)
FROM zeros_mt(1000000)
WHERE NOT ignore(zero);