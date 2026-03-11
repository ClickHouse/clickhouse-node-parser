SELECT '-- Test LIKE perfect prefix on String column - should be rewritten';

SELECT count()
FROM tab
WHERE like(col_string, 'app%');

SELECT count()
FROM tab
WHERE like(col_string, 'app%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, '%Test');

SELECT count()
FROM tab
WHERE like(col_string, '%Test')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_fixedstring, 'fruit%');

SELECT count()
FROM tab
WHERE like(col_fixedstring, 'fruit%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_fixedstring, '%ther\0');

SELECT count()
FROM tab
WHERE like(col_fixedstring, '%ther\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE notLike(col_string, 'app%');

SELECT count()
FROM tab
WHERE notLike(col_string, 'app%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE notLike(col_string, '%Test');

SELECT count()
FROM tab
WHERE notLike(col_string, '%Test')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE ilike(col_string, 'APP%');

SELECT count()
FROM tab
WHERE ilike(col_string, 'APP%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE ilike(col_string, '%TeST');

SELECT count()
FROM tab
WHERE ilike(col_string, '%TeST')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE notILike(col_string, 'APP%');

SELECT count()
FROM tab
WHERE notILike(col_string, 'APP%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE notILike(col_string, '%TeST');

SELECT count()
FROM tab
WHERE notILike(col_string, '%TeST')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, 'app%')
    AND like(col_fixedstring, 'fruit%');

SELECT count()
FROM tab
WHERE like(col_string, 'app%')
    AND like(col_fixedstring, 'fruit%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, 'app_ication%');

SELECT count()
FROM tab
WHERE like(col_string, 'app_ication%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, '%app_ication');

SELECT count()
FROM tab
WHERE like(col_string, '%app_ication')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, '%app%');

SELECT count()
FROM tab
WHERE like(col_string, '%app%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, '_est%');

SELECT count()
FROM tab
WHERE like(col_string, '_est%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, 'Test');

SELECT count()
FROM tab
WHERE like(col_string, 'Test')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_string, '%');

SELECT count()
FROM tab
WHERE like(col_string, '%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

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

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, '%a');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_string, '%a')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_nullable_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_nullable_string, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_nullable_string, '%a');

SELECT count()
FROM tab
WHERE like(col_nullable_string, '%a')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, '%a');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_string, '%a')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_fixedstring, '%a\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_nullable_fixedstring, '%a\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, 'a%');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, 'a%')
SETTINGS optimize_rewrite_like_perfect_affix = 0;

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, '%a\0');

SELECT count()
FROM tab
WHERE like(col_lowcardinality_nullable_fixedstring, '%a\0')
SETTINGS optimize_rewrite_like_perfect_affix = 0;