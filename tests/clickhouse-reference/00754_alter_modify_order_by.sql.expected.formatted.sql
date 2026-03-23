SET send_logs_level = 'fatal';

SET optimize_on_insert = 0;

SYSTEM DROP  TABLE IF EXISTS no_order;

CREATE TABLE no_order
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY tuple();

SYSTEM DROP  TABLE no_order;

SYSTEM DROP  TABLE IF EXISTS old_style;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE old_style
(
    d Date,
    x UInt32
)
ENGINE = MergeTree(d, x, 8192);

SYSTEM DROP  TABLE old_style;

SYSTEM DROP  TABLE IF EXISTS summing;

CREATE TABLE summing
(
    x UInt32,
    y UInt32,
    val UInt32
)
ENGINE = SummingMergeTree
ORDER BY (x, y);

INSERT INTO summing (x, y, z, val);

SELECT *
FROM summing;

INSERT INTO summing (x, y, z, val);

SELECT *
FROM summing FINAL
ORDER BY
    x ASC,
    y ASC,
    z ASC;

SYSTEM DROP  TABLE summing;