CREATE TABLE number (number UInt64) ENGINE = Memory();
SELECT '----- Default Settings -----';
CREATE TABLE set (val UInt64) ENGINE = Set();
SELECT number FROM number WHERE number IN set LIMIT 1;
CREATE TABLE set (val UInt64) ENGINE = Set() SETTINGS persistent=1;
CREATE TABLE set (val UInt64) ENGINE = Set() SETTINGS persistent=0;
