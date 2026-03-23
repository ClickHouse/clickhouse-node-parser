CREATE TABLE t
(
    x Bool
)
ENGINE = Memory();

INSERT INTO t SETTINGS bool_true_representation = 'да';