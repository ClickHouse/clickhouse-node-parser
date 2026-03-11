select * from x where _partition_id = partitionID(1);
select * from x where _partition_id in (select partitionID(number + 1) from numbers(1));
select count() from x where _partition_id in (select partitionID(number + 1) from numbers(1));
select * from mt where toUInt64(substr(_part, 1, position(_part, '_') - 1)) = 1;
