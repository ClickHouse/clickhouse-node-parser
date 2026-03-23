SET enable_analyzer = 1;

SET query_plan_join_swap_table = false;

SET enable_join_runtime_filters = 0;

SYSTEM DROP  TABLE IF EXISTS users;

CREATE TABLE users
(
    uid Int16,
    name String,
    age Int16
)
ENGINE = MergeTree
ORDER BY (uid, name);

INSERT INTO users;

INSERT INTO users;

INSERT INTO users;

SYSTEM DROP  TABLE IF EXISTS users2;

CREATE TABLE users2
(
    uid Int16,
    name String,
    age2 Int16
)
ENGINE = MergeTree
ORDER BY (uid, name);

INSERT INTO users2;

INSERT INTO users2;

INSERT INTO users2;

SELECT '--';

-- { echoOff }
SYSTEM DROP  TABLE users;

SYSTEM DROP  TABLE users2;