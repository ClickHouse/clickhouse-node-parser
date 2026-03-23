set optimize_use_projections = 1, force_optimize_projection = 1;
create table tp (type Int32, device UUID, cnt UInt64) engine = MergeTree order by (type, device);
insert into tp select number%3, generateUUIDv4(), 1 from numbers(300);
