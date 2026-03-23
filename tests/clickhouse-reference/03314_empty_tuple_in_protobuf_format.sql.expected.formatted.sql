-- Tags: no-fasttest
-- ^ depends on the Protobuf library.
SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Tuple()
)
ENGINE = Memory();

INSERT INTO t0 (c0);

INSERT INTO FUNCTION file(concat(currentDatabase(), '.protobuf'), 'Protobuf', 'c0 Tuple()') SELECT c0
FROM t0; -- { serverError NO_COLUMNS_SERIALIZED_TO_PROTOBUF_FIELDS }

SYSTEM DROP  TABLE t0;