SET enable_analyzer = 1;

CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
)
ENGINE = TinyLog;

SELECT '--';