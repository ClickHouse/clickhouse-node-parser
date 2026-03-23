SYSTEM DROP  TABLE IF EXISTS mass_table_457;

CREATE TABLE mass_table_457
(
    key Array(Tuple(Float64, Float64)),
    name String,
    value UInt64
)
ENGINE = Memory;

INSERT INTO mass_table_457 SELECT *
FROM generateRandom('`key` Array(Tuple(Float64, Float64)),`name` String,`value` UInt64', 1, 10, 2)
LIMIT 10;

SELECT *
FROM mass_table_457;

SYSTEM DROP  TABLE mass_table_457;