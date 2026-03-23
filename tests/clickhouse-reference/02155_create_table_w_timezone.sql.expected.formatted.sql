CREATE TABLE t02155_t64_tz
(
    a DateTime64(9, 'America/Chicago')
)
ENGINE = Memory;

CREATE TABLE t02155_t_tz
(
    a DateTime('America/Chicago')
)
ENGINE = Memory;

SYSTEM drop  table t02155_t64_tz;

SYSTEM drop  table t02155_t_tz;