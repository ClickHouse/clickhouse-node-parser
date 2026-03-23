-- No virtual columns should be output in DESC TABLE query.
SYSTEM DROP  TABLE IF EXISTS upyachka;

CREATE TABLE upyachka
(
    x UInt64
)
ENGINE = Memory;

SYSTEM DROP  TABLE upyachka;