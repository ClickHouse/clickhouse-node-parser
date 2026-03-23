SET enable_json_type = 1;

SET allow_experimental_variant_type = 1;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory();

INSERT INTO t0 (c0);

INSERT INTO t0 (c0, c1);