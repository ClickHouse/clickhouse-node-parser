SYSTEM DROP  TABLE IF EXISTS tutorial;

CREATE TABLE tutorial
(
    inner_poly Array(Tuple(Int32, Int32)),
    outer_poly Array(Tuple(Int32, Int32))
)
ENGINE = Log();

SELECT *
FROM tutorial;

INSERT INTO tutorial;

SYSTEM DROP  TABLE tutorial;