CREATE TABLE test1_00671
(
    start Integer,
    `end` Integer
)
ENGINE = Memory;

CREATE TABLE test2_00671
(
    start Integer,
    `end` Integer
)
ENGINE = Memory;

SELECT maxIntersections(start, `end`)
FROM test1_00671;

SELECT maxIntersections(start, `end`)
FROM test2_00671;