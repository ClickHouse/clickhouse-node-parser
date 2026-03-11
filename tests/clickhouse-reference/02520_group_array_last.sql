-- { echo }
-- BAD_ARGUMENTS
select groupArrayLast(number+1) from numbers(5); -- { serverError BAD_ARGUMENTS }
select groupArrayLastArray([number+1]) from numbers(5); -- { serverError BAD_ARGUMENTS }
-- groupArrayLast by number
select groupArrayLast(1)(number+1) from numbers(5);
select groupArrayLast(3)(number+1) from numbers(5);
select groupArrayLast(3)(number+1) from numbers(10);
-- groupArrayLast by String
select groupArrayLast(3)((number+1)::String) from numbers(5);
select groupArrayLast(3)((number+1)::String) from numbers(10);
-- groupArrayLastArray
select groupArrayLastArray(3)([1,2,3,4,5,6]);
select groupArrayLastArray(3)(['1','2','3','4','5','6']);
-- groupArrayLastMerge
-- [10,8,9] + [10,8,9]     => [10,10,9] => [10,10,8] => [9,10,8]
--     ^          ^                  ^      ^^
-- (position to insert at)
select groupArrayLast(3)(number+1) state from remote('127.{1,1}', view(select * from numbers(10)));
select groupArrayLast(3)((number+1)::String) state from remote('127.{1,1}', view(select * from numbers(10)));
select groupArrayLast(3)([number+1]) state from remote('127.{1,1}', view(select * from numbers(10)));
select groupArrayLast(100)(number+1) state from remote('127.{1,1}', view(select * from numbers(10)));
select groupArrayLast(100)((number+1)::String) state from remote('127.{1,1}', view(select * from numbers(10)));
select groupArrayLast(100)([number+1]) state from remote('127.{1,1}', view(select * from numbers(10)));
select * from simple_agg_groupArrayLastArray order by key, value;
select * from simple_agg_groupArrayLastArray final order by key, value;
