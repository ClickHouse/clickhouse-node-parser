Select '-- test create table --' ;
Select * from kql($$Customers|project FirstName$$) limit 1;
select LastName from kql_table1 limit 1;
select * from kql_table2 limit 1;
