SELECT b
FROM trepl FINAL
PREWHERE a < 1000;

SELECT x
FROM versioned_collapsing FINAL
PREWHERE version < 1000;