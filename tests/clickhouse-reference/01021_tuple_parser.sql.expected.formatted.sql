SELECT
    toTypeName(tuple(1)),
    tuple(1);

SYSTEM DROP  TABLE IF EXISTS tuple_values;

CREATE TABLE tuple_values
(
    t Tuple(int)
)
ENGINE = Memory;

INSERT INTO tuple_values;

SYSTEM DROP  TABLE tuple_values;