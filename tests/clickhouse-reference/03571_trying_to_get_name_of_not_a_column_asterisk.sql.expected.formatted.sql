DROP TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = MergeTree
ORDER BY tuple();

ALTER TABLE t0 MODIFY COLUMN c0 Int TTL indexHint(*); -- { serverError UNKNOWN_IDENTIFIER }

DROP TABLE t0;

DROP TABLE IF EXISTS `02577_keepermap_delete_update`;

CREATE TABLE `02577_keepermap_delete_update`
(
    key UInt64,
    value String,
    value2 UInt64
)
PRIMARY KEY key;

DROP TABLE `02577_keepermap_delete_update`;