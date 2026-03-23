SET compatibility_ignore_auto_increment_in_create_table = false;

DROP TABLE IF EXISTS ignore_auto_increment;

CREATE TABLE ignore_auto_increment
(
    id int
)
ENGINE = MergeTree()
ORDER BY tuple(); -- {serverError SYNTAX_ERROR}

SET compatibility_ignore_auto_increment_in_create_table = true;

CREATE TABLE ignore_auto_increment
(
    id INT()
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE ignore_auto_increment
(
    id int,
    di INT(),
    s String
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE ignore_auto_increment
(
    di DEFAULT 1,
    id int,
    s String EPHEMERAL
)
ENGINE = MergeTree()
ORDER BY tuple();