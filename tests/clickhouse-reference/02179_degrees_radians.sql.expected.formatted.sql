SELECT DEGREES(RADIANS(degrees))
FROM test_degs_to_rads
ORDER BY degrees ASC;

SELECT RADIANS(degrees)
FROM test_degs_to_rads
ORDER BY degrees ASC;

SELECT RADIANS(DEGREES(radians))
FROM test_rads_to_degs
ORDER BY radians ASC;

SELECT DEGREES(radians)
FROM test_rads_to_degs
ORDER BY radians ASC;