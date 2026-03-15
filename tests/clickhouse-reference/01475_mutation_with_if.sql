CREATE TABLE mutation_table (
    id int,
    price Nullable(Int32)
)
ENGINE = MergeTree()
PARTITION BY id
ORDER BY id;
SELECT * FROM mutation_table;
create table mutation_table (  dt Nullable(Date), name Nullable(String))
engine MergeTree order by tuple();
select * from mutation_table order by dt, name;
