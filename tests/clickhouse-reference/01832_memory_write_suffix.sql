-- Memory writes from the writeSuffix() and if it will be called twice two rows
-- will be written (since it does not reset the block).
create table data_01832 (key Int) Engine=Memory;
select * from data_01832;
