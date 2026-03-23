create table table1 (
    col1 Int32,
    col2 Int32
)
ENGINE = MergeTree
partition by tuple()
order by col1;
INSERT INTO table1 VALUES (1, 2), (1, 4);
