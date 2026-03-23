SYSTEM DROP  TEMPORARY TABLE IF EXISTS table_to_drop;

SYSTEM DROP  TABLE IF EXISTS table_to_drop;

CREATE TABLE table_to_drop
(
    x Int8
)
ENGINE = Log;

CREATE TEMPORARY TABLE table_to_drop
(
    x Int8
);

SYSTEM DROP  TEMPORARY TABLE table_to_drop;

SYSTEM DROP  TABLE table_to_drop;