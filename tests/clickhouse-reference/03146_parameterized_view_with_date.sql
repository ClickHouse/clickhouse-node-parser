select * from pv (timestamp_param=toDateTime('2024-04-01 00:00:01'));
select * from pv (timestamp_param=toDateTime('2024-040')); -- { serverError CANNOT_PARSE_DATETIME }
