SET allow_experimental_dynamic_type = 1;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = MergeTree()
ORDER BY tuple();