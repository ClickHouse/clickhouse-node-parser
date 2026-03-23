CREATE TABLE tutorial
(
    inner_poly Array(Tuple(Int32, Int32)),
    outer_poly Array(Tuple(Int32, Int32))
)
ENGINE = Log();

SELECT *
FROM tutorial;

INSERT INTO tutorial;