CREATE TABLE tab
(
    x String,
    y UInt8
)
ENGINE = MergeTree
ORDER BY tuple();

SET enable_scopes_for_with_statement = 0;