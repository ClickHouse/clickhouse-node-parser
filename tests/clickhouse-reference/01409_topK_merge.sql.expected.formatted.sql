SELECT length(topK(20)(number))
FROM remote('127.{1,1}', currentDatabase(), data_01409);

SELECT length(topKWeighted(20)(number, 1))
FROM remote('127.{1,1}', currentDatabase(), data_01409);

SELECT length(topK(20)((number, '')))
FROM remote('127.{1,1}', currentDatabase(), data_01409);

SELECT length(topKWeighted(20)((number, ''), 1))
FROM remote('127.{1,1}', currentDatabase(), data_01409);