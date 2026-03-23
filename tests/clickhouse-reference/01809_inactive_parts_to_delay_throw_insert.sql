create table data_01809 (i int) engine MergeTree order by i settings old_parts_lifetime = 10000000000, min_bytes_for_wide_part = 0, inactive_parts_to_throw_insert = 0, inactive_parts_to_delay_insert = 1;
insert into data_01809 values (1);
insert into data_01809 values (2);
insert into data_01809 values (3);
