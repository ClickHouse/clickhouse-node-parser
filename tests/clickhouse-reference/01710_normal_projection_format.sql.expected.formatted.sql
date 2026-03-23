SYSTEM DROP  TABLE if exists test;

CREATE TABLE test
(
    uuid FixedString(16),
    id int,
    ns FixedString(16),
    dt DateTime64(6)
)
ENGINE = MergeTree
ORDER BY (id, dt, uuid);

SYSTEM drop  table test;