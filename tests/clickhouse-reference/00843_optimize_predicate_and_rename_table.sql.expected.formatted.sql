SET enable_optimize_predicate_expression = 1;

CREATE TABLE test1_00843
(
    a UInt8
)
ENGINE = Memory;

INSERT INTO test1_00843;

CREATE VIEW view_00843
AS
SELECT *
FROM test1_00843;

SELECT *
FROM view_00843;