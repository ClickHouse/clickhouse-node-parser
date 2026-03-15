SELECT '----- START -----';
create table morton_numbers_02457(
    n1 UInt32,
    n2 UInt32,
    n3 UInt16,
    n4 UInt16,
    n5 UInt8,
    n6 UInt8,
    n7 UInt8,
    n8 UInt8
)
    Engine=MergeTree()
    ORDER BY n1 SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
select mortonEncode(1,2,3,4);
select mortonDecode(4, 2149);
select mortonEncode(65534, 65533);
select mortonDecode(2, 4294967286);
select mortonEncode(4294967286);
select mortonDecode(1, 4294967286);
create table morton_numbers_1_02457(
    n1 UInt64,
    n2 UInt64,
    n3 UInt64,
    n4 UInt64,
    n5 UInt64,
    n6 UInt64,
    n7 UInt64,
    n8 UInt64
)
    Engine=MergeTree()
    ORDER BY n1 SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
create table morton_numbers_2_02457(
    n1 UInt64,
    n2 UInt64,
    n3 UInt64,
    n4 UInt64
)
    Engine=MergeTree()
    ORDER BY n1 SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
create table morton_numbers_3_02457(
    n1 UInt64,
    n2 UInt64
)
    Engine=MergeTree()
    ORDER BY n1 SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';
