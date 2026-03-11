SELECT type FROM system.columns WHERE table = 'decimal' AND database = currentDatabase() ORDER BY type;
SELECT toTypeName(d2), toTypeName(d3) FROM decimal LIMIT 1;
