SELECT
    toTypeName(tuple(1)),
    tuple(1);

CREATE TABLE tuple_values
(
    t Tuple(int)
)
ENGINE = Memory;

INSERT INTO tuple_values;