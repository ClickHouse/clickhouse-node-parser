SELECT count() > 0
FROM `system`.symbols
WHERE like(symbol_demangled, '%QueryMetricLog::startQuery%')
    AND function_id > 0
    AND length(symbol_demangled) > 10;