-- https://github.com/ClickHouse/ClickHouse/issues/53380
DROP TABLE IF EXISTS parent;

DROP TABLE IF EXISTS child;

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

DROP TABLE child3;

DROP TABLE child2;

DROP TABLE child;

DROP TABLE parent;