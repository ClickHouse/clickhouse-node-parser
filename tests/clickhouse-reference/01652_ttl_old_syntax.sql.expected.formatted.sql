SYSTEM DROP  TABLE IF EXISTS ttl_old_syntax;

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE ttl_old_syntax
(
    d Date,
    i Int
)
ENGINE = MergeTree(d, i, 8291);

SYSTEM DROP  TABLE ttl_old_syntax;