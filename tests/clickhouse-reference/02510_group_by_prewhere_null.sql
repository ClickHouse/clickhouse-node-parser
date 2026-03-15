create table table1 (
    col1 Int32,
    col2 Int32
)
ENGINE = MergeTree
partition by tuple()
order by col1;
