/**
 * Recursively removes `location` and `parent` keys from objects.
 * Used to strip AST metadata for snapshot/equality comparisons.
 */
export function stripMeta(value: unknown): unknown {
  if (value === null || value === undefined || typeof value !== 'object') {
    return value;
  }

  if (Array.isArray(value)) {
    return value.map(stripMeta);
  }

  const result: Record<string, unknown> = {};
  for (const [k, v] of Object.entries(value as Record<string, unknown>)) {
    if (k === 'location' || k === 'parent') continue;
    result[k] = stripMeta(v);
  }
  return result;
}
