SELECT '----- Default Settings -----';

CREATE TABLE `join`
(
    k UInt64,
    s String
)
ENGINE = Join(`ANY`, `LEFT`, k);

SELECT *
FROM `join`;

CREATE TABLE `join`
(
    k UInt64,
    s String
)
ENGINE = Join(`ANY`, `LEFT`, k)
SETTINGS persistent = 1;

CREATE TABLE `join`
(
    k UInt64,
    s String
)
ENGINE = Join(`ANY`, `LEFT`, k)
SETTINGS persistent = 0;