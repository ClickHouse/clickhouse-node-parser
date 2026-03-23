create table tab1 (a1 Int32, b1 Int32) engine = MergeTree order by a1;
create table tab1_copy (a1 Int32, b1 Int32) engine = MergeTree order by a1;
insert into tab1 values (1, 2);
insert into tab1_copy values (2, 3);
select tab1.a1, tab1_copy.a1, tab1.b1 from tab1 any left join tab1_copy on tab1.b1 + 3 = tab1_copy.b1 + 2;
