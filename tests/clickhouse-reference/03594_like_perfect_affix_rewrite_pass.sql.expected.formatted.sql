-- Test for LikePerfectAffixRewritePass optimization in analyzer
SET enable_analyzer = 1;

SET optimize_rewrite_like_perfect_affix = 1;

DROP TABLE IF EXISTS tab;

CREATE TABLE tab
(
    id UInt32,
    col_string String,
    col_fixedstring FixedString(32),
    col_lowcardinality_string LowCardinality(String),
    col_lowcardinality_fixedstring LowCardinality(FixedString(32)),
    col_nullable_string Nullable(String),
    col_nullable_fixedstring Nullable(FixedString(32)),
    col_lowcardinality_nullable_string LowCardinality(Nullable(String)),
    col_lowcardinality_nullable_fixedstring LowCardinality(Nullable(FixedString(32)))
)
ENGINE = MergeTree()
ORDER BY col_string;

INSERT INTO tab;

SELECT '-- Test LIKE perfect prefix on String column - should be rewritten';

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, 'app%');

SELECT count()
FROM tab
WHERE like(col_string, 'app%');

SELECT count()
FROM tab
WHERE like(col_string, 'app%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, '%Test');

SELECT count()
FROM tab
WHERE like(col_string, '%Test');

SELECT count()
FROM tab
WHERE like(col_string, '%Test')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_fixedstring, 'fruit%');

SELECT count()
FROM tab
WHERE like(col_fixedstring, 'fruit%');

SELECT count()
FROM tab
WHERE like(col_fixedstring, 'fruit%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_fixedstring, '%ther\0');

SELECT count()
FROM tab
WHERE like(col_fixedstring, '%ther\0');

SELECT count()
FROM tab
WHERE like(col_fixedstring, '%ther\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE notLike(col_string, 'app%');

SELECT count()
FROM tab
WHERE notLike(col_string, 'app%');

SELECT count()
FROM tab
WHERE notLike(col_string, 'app%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE notLike(col_string, '%Test');

SELECT count()
FROM tab
WHERE notLike(col_string, '%Test');

SELECT count()
FROM tab
WHERE notLike(col_string, '%Test')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE ilike(col_string, 'APP%');

SELECT count()
FROM tab
WHERE ilike(col_string, 'APP%');

SELECT count()
FROM tab
WHERE ilike(col_string, 'APP%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE ilike(col_string, '%TeST');

SELECT count()
FROM tab
WHERE ilike(col_string, '%TeST');

SELECT count()
FROM tab
WHERE ilike(col_string, '%TeST')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE notILike(col_string, 'APP%');

SELECT count()
FROM tab
WHERE notILike(col_string, 'APP%');

SELECT count()
FROM tab
WHERE notILike(col_string, 'APP%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE notILike(col_string, '%TeST');

SELECT count()
FROM tab
WHERE notILike(col_string, '%TeST');

SELECT count()
FROM tab
WHERE notILike(col_string, '%TeST')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, 'app%')
    AND like(col_fixedstring, 'fruit%');

SELECT count()
FROM tab
WHERE like(col_string, 'app%')
    AND like(col_fixedstring, 'fruit%');

SELECT count()
FROM tab
WHERE like(col_string, 'app%')
    AND like(col_fixedstring, 'fruit%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, 'app_ication%');

SELECT count()
FROM tab
WHERE like(col_string, 'app_ication%');

SELECT count()
FROM tab
WHERE like(col_string, 'app_ication%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, '%app_ication');

SELECT count()
FROM tab
WHERE like(col_string, '%app_ication');

SELECT count()
FROM tab
WHERE like(col_string, '%app_ication')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, '%app%');

SELECT count()
FROM tab
WHERE like(col_string, '%app%');

SELECT count()
FROM tab
WHERE like(col_string, '%app%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, '_est%');

SELECT count()
FROM tab
WHERE like(col_string, '_est%');

SELECT count()
FROM tab
WHERE like(col_string, '_est%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, 'Test');

SELECT count()
FROM tab
WHERE like(col_string, 'Test');

SELECT count()
FROM tab
WHERE like(col_string, 'Test')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_string, '%');

SELECT count()
FROM tab
WHERE like(col_string, '%');

SELECT count()
FROM tab
WHERE like(col_string, '%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE notLike(col_string, 'app_ication%');

SELECT count()
FROM tab
WHERE notLike(col_string, 'app_ication%');

SELECT count()
FROM tab
WHERE notLike(col_string, 'app_ication%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE ilike(col_string, 'app_ication%');

SELECT count()
FROM tab
WHERE ilike(col_string, 'app_ication%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE notILike(col_string, '%app_ication');

SELECT count()
FROM tab
WHERE notILike(col_string, '%app_ication')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, '%a');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, '%a');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, '%a')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_nullable_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_nullable_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_nullable_string, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_nullable_string, '%a');

SELECT count()
FROM tab
WHERE like(col_nullable_string, '%a');

SELECT count()
FROM tab
WHERE like(col_nullable_string, '%a')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, '%a');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, '%a');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, '%a')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, '%a\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, '%a\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

EXPLAIN SYNTAX run_query_tree_passes = 1
SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, '%a\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

DROP TABLE tab;