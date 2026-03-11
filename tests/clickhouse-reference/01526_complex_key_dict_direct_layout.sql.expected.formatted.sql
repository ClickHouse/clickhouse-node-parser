SELECT dictGet('db_01526.dict1', 'third_column', (number, number + 1))
FROM numbers(4);

SELECT dictHas('db_01526.dict1', (toUInt64(1), toUInt64(3)));