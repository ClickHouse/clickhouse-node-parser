SELECT
    m1[i1],
    m2[i1],
    m3[i1]
FROM t_map_02014;

SELECT
    m1[i2],
    m2[i2],
    m3[i2]
FROM t_map_02014;

SELECT
    m1['aaa'],
    m2['aaa']
FROM t_map_02014;

SELECT
    m1['aaa'::FixedString(3)],
    m2['aaa'::FixedString(3)]
FROM t_map_02014;

SELECT
    m1[s],
    m2[s]
FROM t_map_02014;

SELECT
    m1[fs],
    m2[fs]
FROM t_map_02014;

SELECT length(m2['aaa'::FixedString(4)])
FROM t_map_02014;