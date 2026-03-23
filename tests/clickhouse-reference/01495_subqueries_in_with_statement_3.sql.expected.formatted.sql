CREATE TABLE cte1
(
    a Int64
)
ENGINE = Memory;

CREATE TABLE cte2
(
    a Int64
)
ENGINE = Memory;

INSERT INTO cte1 SELECT *
FROM numbers(10000);

INSERT INTO cte2 SELECT *
FROM numbers(5000);