-- Tags: no-ordinary-database, no-fasttest
SYSTEM DROP  TABLE IF EXISTS 02707_keepermap_delete_update;

SET keeper_map_strict_mode = 1;

CREATE TABLE `02707_keepermap_delete_update`
(
    key UInt64,
    value String,
    value2 UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test02707_keepermap_delete_update'))
PRIMARY KEY key;

INSERT INTO `02707_keepermap_delete_update`;

SELECT
    *,
    _version,
    _version
FROM `02707_keepermap_delete_update`
ORDER BY key ASC;

SELECT '-----------';

SELECT
    *,
    _version
FROM `02707_keepermap_delete_update`
ORDER BY key ASC;

SELECT count()
FROM `02707_keepermap_delete_update`;

INSERT INTO `02707_keepermap_delete_update`;