SELECT tuple(1, 1, number) AS t
FROM numbers_mt(1000001)
ORDER BY
    t ASC,
    number ASC
LIMIT 1;