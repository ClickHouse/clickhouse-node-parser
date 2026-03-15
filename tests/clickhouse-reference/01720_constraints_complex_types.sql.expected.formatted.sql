SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE constraint_on_nullable_type
(
    id Nullable(UInt64),
    CONSTRAINT c0 CHECK id = 1
)
ENGINE = TinyLog();

SELECT *
FROM constraint_on_nullable_type;

CREATE TABLE constraint_on_low_cardinality_type
(
    id LowCardinality(UInt64),
    CONSTRAINT c0 CHECK id = 2
)
ENGINE = TinyLog;

SELECT *
FROM constraint_on_low_cardinality_type;

CREATE TABLE constraint_on_low_cardinality_nullable_type
(
    id LowCardinality(Nullable(UInt64)),
    CONSTRAINT c0 CHECK id = 3
)
ENGINE = TinyLog;

SELECT *
FROM constraint_on_low_cardinality_nullable_type;