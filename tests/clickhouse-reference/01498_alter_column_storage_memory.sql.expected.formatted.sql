SYSTEM DROP  TABLE IF EXISTS defaults;

CREATE TABLE defaults
(
    n Int32,
    s String
)
ENGINE = Memory();

SYSTEM DROP  TABLE defaults;