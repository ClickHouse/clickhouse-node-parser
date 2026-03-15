SET enable_analyzer = 1;
SET query_plan_join_swap_table = false;
SET enable_join_runtime_filters = 0;
CREATE TABLE users (uid Int16, name String, age Int16) ENGINE=MergeTree order by (uid, name);
CREATE TABLE users2 (uid Int16, name String, age2 Int16) ENGINE=MergeTree order by (uid, name);
SELECT '--';
