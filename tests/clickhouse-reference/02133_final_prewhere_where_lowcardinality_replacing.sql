SELECT toTypeName(level) FROM errors_local FINAL PREWHERE isNotNull(level) WHERE isNotNull(level) LIMIT 1;
