CREATE TABLE mutation_table (
    id int,
    price Nullable(Int32)
)
ENGINE = MergeTree()
PARTITION BY id
ORDER BY id;
INSERT INTO mutation_table (id, price) VALUES (1, 100);
SELECT * FROM mutation_table;
create table mutation_table (  dt Nullable(Date), name Nullable(String))
engine MergeTree order by tuple();
insert into mutation_table (name, dt) values ('car', '2020-02-28');
insert into mutation_table (name, dt) values ('dog', '2020-03-28');
select * from mutation_table order by dt, name;
insert into mutation_table (name, dt) values ('car', Null);
insert into mutation_table (name, dt) values ('cat', Null);
insert into mutation_table (name, dt) values (Null, '2020-08-05');
