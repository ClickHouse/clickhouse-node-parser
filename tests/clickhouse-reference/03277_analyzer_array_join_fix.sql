SELECT
    a,
    foo.x
FROM repro_dist
ARRAY JOIN foos AS foo;
