create table table_map (a Map(String, String)) engine = Memory;
select a['name'] from table_map;
create table table_map (a Map(String, UInt64)) engine = MergeTree() order by a SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select a['key1'], a['key2'] from table_map;
create table table_map (a Map(String, String), b String) engine = MergeTree() order by a SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select a[b] from table_map;
select b from table_map where a = map('name','lisi', 'gender', 'female');
-- Big Integer type

create table table_map (d DATE, m Map(Int8, UInt256)) ENGINE = MergeTree() order by d SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select * from table_map;
-- Integer type

create table table_map (d DATE, m Map(Int8, Int8)) ENGINE = MergeTree() order by d SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
create table table_map(a Map(UInt8, UInt64), b UInt8) Engine = MergeTree() order by b SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
create table table_map(a Map(String, Array(UInt8))) Engine = MergeTree() order by a SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select a['k1'] as col1 from table_map order by col1;
SELECT CAST(([1, 2, 3], ['1', '2', 'foo']), 'Map(UInt8, String)') AS map, map[1];
CREATE TABLE table_map (n UInt32, m Map(String, Int))
ENGINE = MergeTree ORDER BY n SETTINGS min_bytes_for_wide_part = 0, index_granularity = 8192, index_granularity_bytes = '10Mi';
SELECT sum(m['1']), sum(m['7']), sum(m['100']) FROM table_map;
CREATE TABLE table_map (n UInt32, m Map(String, Int))
ENGINE = MergeTree ORDER BY n SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
SELECT CAST(([2, 1, 1023], ['', '']), 'Map(UInt8, String)') AS map, map[10] -- { serverError TYPE_MISMATCH}
