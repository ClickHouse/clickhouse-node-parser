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

DELETE FROM `02577_keepermap_delete_update` WHERE like(indexHint(*, indexHint(indexHint(toNullable(1.), 0, isNotNull((isNull(20))), isNull(indexHint(indexHint(indexHint(indexHint(*), *), isZeroOrNull(materialize(indexHint(*, indexHint(toNullable(isNull(toInt128(100)), 1.), toLowCardinality(0), isNull(isNullable(toNullable(20))), indexHint(isZeroOrNull(15), *, indexHint(*)), *), 100), 15))), indexHint(indexHint(isNullable(materialize(isNotNull(15)))), 100, *), 1, indexHint(indexHint(1, indexHint(100, *)), *)), toLowCardinality(15)), indexHint(*)), *)), value, 'Some%string'); -- { serverError UNKNOWN_IDENTIFIER }

DROP TABLE `02577_keepermap_delete_update`;