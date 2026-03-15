SET enable_lightweight_update = 1;
CREATE TABLE mutation_table
(
    id int,
    price Nullable(Int32)
)
ENGINE = MergeTree()
PARTITION BY id
ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 1;
SELECT * FROM mutation_table;
create table mutation_table (dt Nullable(Date), name Nullable(String))
engine MergeTree order by tuple()
settings enable_block_number_column = 1, enable_block_offset_column = 1;
select * from mutation_table order by dt, name;
