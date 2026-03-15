create table parent (id int, primary key(id)) engine MergeTree;
create table child  (id int, pid int, primary key(id), foreign key(pid) references parent(pid)) engine MergeTree;
create table child2 (id int, pid int, primary key(id), 
                     foreign key(pid) references parent(pid) on delete cascade) engine MergeTree;
create table child3 (id int, pid int, primary key(id), 
                     foreign key(pid) references parent(pid) on delete cascade on update restrict) engine MergeTree;
