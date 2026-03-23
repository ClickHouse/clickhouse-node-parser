-- https://github.com/ClickHouse/ClickHouse/issues/53380
SYSTEM drop  table if exists parent;

SYSTEM drop  table if exists child;

CREATE TABLE parent
(
    id int,
    PRIMARY KEY(id)
)
ENGINE = MergeTree;

CREATE TABLE child
(
    id int,
    pid int,
    FOREIGN KEY (pid) REFERENCES parent (pid),
    PRIMARY KEY(id)
)
ENGINE = MergeTree;

CREATE TABLE child2
(
    id int,
    pid int,
    FOREIGN KEY (pid) REFERENCES parent (pid),
    PRIMARY KEY(id)
)
ENGINE = MergeTree;

CREATE TABLE child3
(
    id int,
    pid int,
    FOREIGN KEY (pid) REFERENCES parent (pid),
    PRIMARY KEY(id)
)
ENGINE = MergeTree;

SYSTEM drop  table child3;

SYSTEM drop  table child2;

SYSTEM drop  table child;

SYSTEM drop  table parent;