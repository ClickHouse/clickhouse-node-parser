select a['name'] from table_map;
select a['key1'], a['key2'] from table_map;
select a[b] from table_map;
select b from table_map where a = map('name','lisi', 'gender', 'female');
select * from table_map;
select a['k1'] as col1 from table_map order by col1;
SELECT CAST(([1, 2, 3], ['1', '2', 'foo']), 'Map(UInt8, String)') AS map, map[1];
SELECT sum(m['1']), sum(m['7']), sum(m['100']) FROM table_map;
SELECT CAST(([2, 1, 1023], ['', '']), 'Map(UInt8, String)') AS map, map[10] -- { serverError TYPE_MISMATCH}
