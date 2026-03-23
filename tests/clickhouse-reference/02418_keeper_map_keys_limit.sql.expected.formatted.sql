CREATE TABLE `02418_test`
(
    key UInt64,
    value Float64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2418'), 3)
PRIMARY KEY key;

INSERT INTO `02418_test`;

SELECT count()
FROM `02418_test`;

INSERT INTO `02418_test`; -- { serverError LIMIT_EXCEEDED }

INSERT INTO `02418_test`;

CREATE TABLE `02418_test_another`
(
    key UInt64,
    value Float64
)
ENGINE = KeeperMap(concat('/', currentDatabase(), '/test2418'), 4)
PRIMARY KEY key;

INSERT INTO `02418_test`; -- { serverError LIMIT_EXCEEDED }

INSERT INTO `02418_test_another`;

SELECT count()
FROM `02418_test_another`;

INSERT INTO `02418_test`;

INSERT INTO `02418_test`; -- { serverError LIMIT_EXCEEDED }