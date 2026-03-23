SET enable_analyzer = 1;

DROP TABLE IF EXISTS tree;

CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
)
ENGINE = TinyLog;

INSERT INTO tree;

SELECT '--';

DROP TABLE tree;