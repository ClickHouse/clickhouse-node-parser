SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE alter_00061
(
    d Date,
    k UInt64,
    i32 Int32
)
ENGINE = MergeTree(d, k, 8192);

INSERT INTO alter_00061;

SELECT *
FROM alter_00061
ORDER BY k ASC;

INSERT INTO alter_00061;

INSERT INTO alter_00061;

INSERT INTO alter_00061;