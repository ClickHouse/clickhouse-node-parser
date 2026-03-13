SELECT sumMap([number], [number])
FROM `system`.numbers_mt; -- { serverError MEMORY_LIMIT_EXCEEDED }