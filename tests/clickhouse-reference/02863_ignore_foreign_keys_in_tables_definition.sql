-- https://github.com/ClickHouse/ClickHouse/issues/53380


drop table if exists parent;
drop table if exists child;
create table parent (id int, primary key(id)) engine MergeTree;
create table child  (id int, pid int, primary key(id), foreign key(pid) references parent(pid)) engine MergeTree;
create table child2 (id int, pid int, primary key(id), 
                     foreign key(pid) references parent(pid) on delete cascade) engine MergeTree;
create table child3 (id int, pid int, primary key(id), 
                     foreign key(pid) references parent(pid) on delete cascade on update restrict) engine MergeTree;
drop table child3;
drop table child2;
drop table child;
drop table parent;
