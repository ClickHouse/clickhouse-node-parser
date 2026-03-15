-- add_minmax_index_for_numeric_columns=0: Different plan
create table test1
(
    c UInt32,
    a alias c + 1,
    index i (a) type minmax
)
engine = MergeTree
order by c
settings index_granularity = 8192, min_index_granularity_bytes = 1024, index_granularity_bytes = 10485760, add_minmax_index_for_numeric_columns=0; -- default settings, prevent randomization in tests
create table test2
(
    c UInt32,
    a1 alias c + 1,
    a2 alias a1 + 1,
    index i (a2) type minmax
)
engine = MergeTree
order by c
settings index_granularity = 8192, min_index_granularity_bytes = 1024, index_granularity_bytes = 10485760, add_minmax_index_for_numeric_columns=0; -- default settings, prevent randomization in tests
