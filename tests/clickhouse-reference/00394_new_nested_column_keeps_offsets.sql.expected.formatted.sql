SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE alter_00394
(
    d Date,
    k UInt64,
    i32 Int32,
    n Nested(ui8 UInt8, s String)
)
ENGINE = MergeTree(d, k, 8192);

INSERT INTO alter_00394;

INSERT INTO alter_00394;

INSERT INTO alter_00394;

SELECT
    `n.i8`,
    `n.ui8`,
    `n.s`
FROM alter_00394
ORDER BY k ASC;

SELECT `n.i8`
FROM alter_00394
ORDER BY k ASC;