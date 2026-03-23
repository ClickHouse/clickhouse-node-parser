CREATE TABLE number
(
    number UInt64
)
ENGINE = Memory();

INSERT INTO number;

SELECT '----- Default Settings -----';

CREATE TABLE `set`
(
    val UInt64
)
ENGINE = Set();

INSERT INTO `set`;

SELECT number
FROM number
WHERE number IN (`set`)
LIMIT 1;

CREATE TABLE `set`
(
    val UInt64
)
ENGINE = Set()
SETTINGS persistent = 1;

CREATE TABLE `set`
(
    val UInt64
)
ENGINE = Set()
SETTINGS persistent = 0;