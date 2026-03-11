SELECT count(val)
FROM test
SETTINGS optimize_use_implicit_projections = 1;