SELECT
    arrayElementOrNull(m1, i1),
    arrayElementOrNull(m2, i1),
    arrayElementOrNull(m3, i1)
FROM t_map_03240;

SELECT
    arrayElementOrNull(m1, i2),
    arrayElementOrNull(m2, i2),
    arrayElementOrNull(m3, i2)
FROM t_map_03240;

SELECT
    arrayElementOrNull(m1, 'aaa'),
    arrayElementOrNull(m2, 'aaa')
FROM t_map_03240;

SELECT
    arrayElementOrNull(m1, 'aaa'::FixedString(3)),
    arrayElementOrNull(m2, 'aaa'::FixedString(3))
FROM t_map_03240;

SELECT
    arrayElementOrNull(m1, s),
    arrayElementOrNull(m2, s)
FROM t_map_03240;

SELECT
    arrayElementOrNull(m1, fs),
    arrayElementOrNull(m2, fs)
FROM t_map_03240;

SELECT length(arrayElementOrNull(m2, 'aaa'::FixedString(4)))
FROM t_map_03240;