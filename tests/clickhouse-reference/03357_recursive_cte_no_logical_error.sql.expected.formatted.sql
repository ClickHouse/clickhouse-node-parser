SET enable_analyzer = 1;

CREATE TABLE department__fuzz_0
(
    id UInt64,
    parent_department Decimal(76, 43),
    name String
)
ENGINE = TinyLog;