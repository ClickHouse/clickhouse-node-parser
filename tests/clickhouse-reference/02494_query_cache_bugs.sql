SELECT '-- Bug 56258: Check literals (ASTLiteral)';
SELECT 10 FORMAT Vertical SETTINGS use_query_cache = 1;
SELECT 10 AS x FORMAT Vertical SETTINGS use_query_cache = 1;
SELECT count(*) FROM system.query_cache;
SELECT toUInt64(42) FORMAT Vertical SETTINGS use_query_cache = 1;
SELECT toUInt64(42) AS x FORMAT Vertical SETTINGS use_query_cache = 1;
SELECT c FROM tab FORMAT Vertical SETTINGS use_query_cache = 1;
SELECT c AS x FROM tab FORMAT Vertical SETTINGS use_query_cache = 1;
