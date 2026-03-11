SELECT c0, c0 IS NULL as is_null FROM t_join_nullable_string;
SELECT c0, c0 IS NULL as is_null FROM t_join_nullable_string ORDER BY c0 NULLS LAST;
SELECT c0, val FROM t_join_nullable_string;
SELECT c0, val FROM t_join_nullable_string ORDER BY val;
