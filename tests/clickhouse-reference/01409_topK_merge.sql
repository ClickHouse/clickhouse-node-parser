select length(topK(20)(number)) from remote('127.{1,1}', currentDatabase(), data_01409);
select length(topKWeighted(20)(number, 1)) from remote('127.{1,1}', currentDatabase(), data_01409);
select length(topK(20)((number, ''))) from remote('127.{1,1}', currentDatabase(), data_01409);
select length(topKWeighted(20)((number, ''), 1)) from remote('127.{1,1}', currentDatabase(), data_01409);
