SELECT kv['a']
FROM map_lc;

SELECT
    map(toFixedString('1', 1), 1) AS m,
    m[toFixedString('1', 1)],
    m[toFixedString('1', 2)];