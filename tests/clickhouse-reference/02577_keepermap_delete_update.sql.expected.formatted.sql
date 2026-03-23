-- Tags: no-ordinary-database, no-fasttest
DROP TABLE IF EXISTS `02577_keepermap_delete_update`;

CREATE TABLE `02577_keepermap_delete_update`
(
    key UInt64,
    value String,
    value2 UInt64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test02577_keepermap_delete_update'))
PRIMARY KEY key;

INSERT INTO `02577_keepermap_delete_update`;

SELECT
    *,
    _version
FROM `02577_keepermap_delete_update`
ORDER BY key ASC;

SELECT '-----------';

SELECT count()
FROM `02577_keepermap_delete_update`;

INSERT INTO `02577_keepermap_delete_update`;