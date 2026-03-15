-- Tags: no-parallel
SET create_if_not_exists = 0; -- Default

CREATE TABLE example_table
(
    id UInt32
)
ENGINE = MergeTree()
ORDER BY id;

CREATE DATABASE example_database;

SET create_if_not_exists = 1;