SELECT count()
FROM test_tuple
PREWHERE sipHash64(sipHash64(p, toString(toDate(p))), toString(toDate(p))) % -0.
WHERE i > NULL
SETTINGS
    optimize_trivial_count_query = 0,
    optimize_use_implicit_projections = 1;