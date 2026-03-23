SYSTEM DROP  TABLE IF EXISTS t_index_3146;

CREATE TABLE t_index_3146
(
    a UInt64,
    b UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SET allow_create_index_without_type = 1;

CREATE INDEX i1 ON t_index_3146 (a) TYPE minmax;

CREATE INDEX i2 ON t_index_3146 (tuple(a, b)) TYPE minmax;

CREATE INDEX i3 ON t_index_3146 (tuple(a, b)) TYPE minmax;

CREATE INDEX i4 ON t_index_3146 (a) TYPE minmax;

CREATE INDEX i5 ON t_index_3146 (a); -- ignored

CREATE INDEX i6 ON t_index_3146 (tuple(a, b)); -- ignored

SYSTEM DROP  TABLE t_index_3146;