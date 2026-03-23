-- No virtual columns should be output in DESC TABLE query.

DROP TABLE IF EXISTS upyachka;
CREATE TABLE upyachka (x UInt64) ENGINE = Memory;
DROP TABLE upyachka;
