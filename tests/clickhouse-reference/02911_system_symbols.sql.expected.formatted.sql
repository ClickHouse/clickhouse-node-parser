SELECT x
FROM (
        SELECT demangle(symbol) AS x
        FROM `system`.symbols
        WHERE like(symbol, '%StorageSystemSymbols%')
    )
WHERE like(x, '%DB::StorageSystemSymbols::StorageSystemSymbols%')
ORDER BY x ASC
LIMIT 1
SETTINGS allow_introspection_functions = 1;