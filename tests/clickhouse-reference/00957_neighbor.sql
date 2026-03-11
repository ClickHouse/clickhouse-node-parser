-- no arguments
select neighbor(); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
-- single argument
select neighbor(1); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
-- greater than 3 arguments
select neighbor(1,2,3,4); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }
-- bad default value
select neighbor(dummy, 1, 'hello'); -- { serverError NO_COMMON_TYPE }
-- types without common supertype (UInt64 and Int8)
select number, neighbor(number, 1, -10) from numbers(3); -- { serverError NO_COMMON_TYPE }
-- nullable offset is not allowed
select number, if(number > 1, number, null) as offset, neighbor(number, offset) from numbers(3); -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
select number, neighbor(number, 0) from numbers(3);
select  if(number > 1, number, null) as value, number as offset, neighbor(value, offset) as neighbor from numbers(3);
select toInt32(number) as n, neighbor(n, 1, -10) from numbers(3);
select number, neighbor(number, 10) from numbers(3);
select number, neighbor(number, -10) from numbers(3);
select number, neighbor(number, 1) from numbers(3);
select number, neighbor(number, 2, number + 10) from numbers(4);
select number, neighbor(number, -2, number + 10) from numbers(4);
select number, neighbor(number, 1, 1000) from numbers(3);
select number, neighbor(number, -1, 1000) from numbers(3);
select number, number * 2 as offset, neighbor(number, offset, number * 10) from numbers(4);
select number, -number * 2 as offset, neighbor(number, offset, number * 10) from numbers(6);
select number, -(number - 2) * 2 as offset, neighbor(number, offset) from numbers(6);
select number, neighbor(1000, 10) from numbers(3);
