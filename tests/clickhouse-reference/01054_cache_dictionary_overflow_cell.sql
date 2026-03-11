select 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(1)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(2)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(3)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(4)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(5)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(6)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(7)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(8)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(9)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(10)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(11)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(12)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(13)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(14)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(15)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(16)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(17)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(18)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(19)), 
dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(20));
SELECT arrayMap(x -> dictGet('one_cell_cache_ints_overflow', 'i8', toUInt64(x)), array)
FROM
(
    SELECT [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20] AS array
);
