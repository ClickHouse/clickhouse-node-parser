CREATE TABLE t
(
    st FixedString(54)
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO t;