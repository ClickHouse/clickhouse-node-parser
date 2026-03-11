-- First populate the cache of hash table sizes
select * from lhs as t1 join rhs as t2 on t1.a = t2.a format Null;
-- For the next run we will preallocate the space
select * from lhs as t1 join rhs as t2 on t1.a = t2.a format Null settings log_comment = '03319_second_query';
select ProfileEvents['HashJoinPreallocatedElementsInHashTables']
from system.query_log
where event_date >= yesterday() and current_database = currentDatabase() and type = 'QueryFinish' and log_comment = '03319_second_query';
