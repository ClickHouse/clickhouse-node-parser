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