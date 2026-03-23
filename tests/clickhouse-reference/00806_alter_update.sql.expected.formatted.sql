SYSTEM DROP  TABLE IF EXISTS alter_update_00806;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE alter_update_00806
(
    d Date,
    e Enum8('foo' = 1, 'bar' = 2)
)
ENGINE = MergeTree(d, (d), 8192);

INSERT INTO alter_update_00806 (d, e);

INSERT INTO alter_update_00806 (d, e);

SELECT e
FROM alter_update_00806
ORDER BY d ASC;

SYSTEM DROP  TABLE alter_update_00806;