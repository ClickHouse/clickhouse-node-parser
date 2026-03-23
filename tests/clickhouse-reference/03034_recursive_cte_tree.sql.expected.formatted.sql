SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS tree;

CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
)
ENGINE = TinyLog;

INSERT INTO tree;

SELECT '--';

SYSTEM DROP  TABLE tree;