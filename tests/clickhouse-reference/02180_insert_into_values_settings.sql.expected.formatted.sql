SYSTEM drop  table if exists t;

CREATE TABLE t
(
    x Bool
)
ENGINE = Memory();

INSERT INTO t SETTINGS bool_true_representation = 'да';

SYSTEM drop  table t;