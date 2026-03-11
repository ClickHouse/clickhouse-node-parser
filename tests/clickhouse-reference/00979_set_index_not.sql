select * from set_index_not where status!='rip';
select * from set_index_not where NOT (status ='rip');
select * from set_index_not where NOT (status!='rip');
select * from set_index_not where NOT (NOT (status ='rip'));
