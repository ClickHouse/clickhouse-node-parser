select * from table1 where (id1, id2) in (select tuple(id1, id2) from table2);
