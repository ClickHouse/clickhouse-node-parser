SELECT a['name']
FROM table_map;

SELECT
    a['key1'],
    a['key2']
FROM table_map;

SELECT a[b]
FROM table_map;

SELECT b
FROM table_map
WHERE a = map('name', 'lisi', 'gender', 'female');

SELECT *
FROM table_map;

SELECT a['k1'] AS col1
FROM table_map
ORDER BY col1 ASC;

SELECT
    CAST(([1, 2, 3], ['1', '2', 'foo']), 'Map(UInt8, String)') AS map,
    map[1];

SELECT
    sum(m['1']),
    sum(m['7']),
    sum(m['100'])
FROM table_map;

SELECT
    CAST(([2, 1, 1023], ['', '']), 'Map(UInt8, String)') AS map,
    map[10];