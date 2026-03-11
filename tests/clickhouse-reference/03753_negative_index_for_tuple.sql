-- { echo }

select (1, 2).-1, (1, 2).-2;
select ().-1; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
select (1, 2, 3).-4; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
select (1, 2).-1000000000000000000000000000000000000000000; -- { serverError ILLEGAL_TYPE_OF_ARGUMENT }
SELECT tupleElement((1, 'hello'), -10, 2);
select * from (select _partition_value.-1 from a1 union all select _partition_value.-1 from a2) order by all;
