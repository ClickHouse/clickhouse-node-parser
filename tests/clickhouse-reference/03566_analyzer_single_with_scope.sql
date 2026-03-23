create table tab (x String, y UInt8) engine = MergeTree order by tuple();
insert into tab select 'rue', 1;
SET enable_scopes_for_with_statement = 0;
