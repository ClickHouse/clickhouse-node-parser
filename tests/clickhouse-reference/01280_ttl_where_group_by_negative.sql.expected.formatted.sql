-- Tags: no-parallel
CREATE TABLE ttl_01280_error
(
    a Int,
    b Int,
    x Int64,
    y Int64,
    d DateTime
)
ENGINE = MergeTree
ORDER BY (a, b)
TTL d + toIntervalSecond(1); -- { serverError BAD_TTL_EXPRESSION}

CREATE TABLE ttl_01280_error
(
    a Int,
    b Int,
    x Int64,
    y Int64,
    d DateTime
)
ENGINE = MergeTree
ORDER BY (a, b)
TTL d + toIntervalSecond(1); -- { serverError BAD_TTL_EXPRESSION}

CREATE TABLE ttl_01280_error
(
    a Int,
    b Int,
    x Int64,
    y Int64,
    d DateTime
)
ENGINE = MergeTree
ORDER BY (a, b)
TTL d + toIntervalSecond(1); -- { serverError BAD_TTL_EXPRESSION}

CREATE TABLE ttl_01280_error
(
    a Int,
    b Int,
    x Int64,
    y Int64,
    d DateTime
)
ENGINE = MergeTree
ORDER BY (a, b)
TTL d + toIntervalSecond(1); -- { serverError BAD_TTL_EXPRESSION}