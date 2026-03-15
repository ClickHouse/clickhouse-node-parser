create table table_pv (id Int32, timestamp_field DateTime) engine = Memory();
create view pv as select * from table_pv where timestamp_field > {timestamp_param:DateTime};
select * from pv (timestamp_param=toDateTime('2024-04-01 00:00:01'));
select * from pv (timestamp_param=toDateTime('2024-040')); -- { serverError CANNOT_PARSE_DATETIME }
