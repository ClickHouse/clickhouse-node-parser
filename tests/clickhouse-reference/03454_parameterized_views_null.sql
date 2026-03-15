SET enable_analyzer = 1;
create view test_table as select * from system.one where dummy={param:Nullable(Int64)} IS NULL;
select * from test_table(param=NULL);
