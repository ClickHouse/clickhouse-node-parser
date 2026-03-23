CREATE TABLE join_test
(
    id UInt16,
    num UInt16
)
ENGINE = Join(`ANY`, `LEFT`, id);

SELECT joinGetOrNull('join_test', 'num', 500);

CREATE TABLE join_test
(
    id UInt16,
    num Nullable(UInt16)
)
ENGINE = Join(`ANY`, `LEFT`, id);

CREATE TABLE join_test
(
    id UInt16,
    num Array(UInt16)
)
ENGINE = Join(`ANY`, `LEFT`, id);

CREATE TABLE test
(
    x Date,
    y String
)
ENGINE = Join(`ANY`, `LEFT`, x);

INSERT INTO test;