SELECT *
FROM merge_tree_pk
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM merge_tree_pk FINAL
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM merge_tree_pk_sql
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM merge_tree_pk_sql FINAL
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM replicated_merge_tree_pk_sql
ORDER BY
    key ASC,
    value ASC;

SELECT *
FROM replicated_merge_tree_pk_sql FINAL
ORDER BY
    key ASC,
    value ASC;