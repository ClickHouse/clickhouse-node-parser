SET enable_analyzer = 1;
SET query_plan_join_swap_table = 0;
SET enable_parallel_replicas = 0;
SET enable_join_runtime_filters = 0;
CREATE TABLE users1 (uid Int16, name String, age Int16) ENGINE=Memory;
CREATE TABLE users2 (uid Int16, name String, age Int16) ENGINE=Memory;
