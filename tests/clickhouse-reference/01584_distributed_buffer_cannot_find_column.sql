-- Data is written to the buffer table but has not been written to the Distributed table
select sum(amount) = 100 from realtimebuff;
-- Data has been flushed from Buffer table to the Distributed table and can possibly being sent to 0, 1 or 2 shards.
-- Both shards reside on localhost in the same table.
select sum(amount) IN (0, 100, 200) from realtimebuff;
select sum(amount) = 200 from realtimebuff;
