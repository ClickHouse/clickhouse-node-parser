import type { Statement, ASTNodeKind, ASTNodeKindMap } from './ast';

/**
 * Recursively finds all AST nodes of the given `kind` in one or more parsed
 * statements.
 *
 * @example
 * ```ts
 * import { parse, findNodes } from '@clickhouse/parser';
 *
 * const ast = parse('SELECT * FROM t WHERE id = {id:UInt64}');
 *
 * findNodes(ast, 'queryParam');
 * // [{ kind: 'queryParam', name: 'id', type: 'UInt64' }]
 *
 * findNodes(ast, 'columnRef');
 * // [{ kind: 'columnRef', parts: ['id'] }]
 *
 * findNodes(ast, 'tableRef');
 * // [{ kind: 'tableRef', table: 't' }]
 * ```
 */
export function findNodes<K extends ASTNodeKind>(
  statements: Statement[],
  kind: K,
): ASTNodeKindMap[K][] {
  const results: ASTNodeKindMap[K][] = [];
  const seen = new Set<unknown>();

  function walk(node: unknown): void {
    if (node === null || node === undefined || typeof node !== 'object') {
      return;
    }

    if (seen.has(node)) return;
    seen.add(node);

    if (Array.isArray(node)) {
      for (const item of node) {
        walk(item);
      }
      return;
    }

    const obj = node as Record<string, unknown>;
    if (obj.kind === kind) {
      results.push(obj as ASTNodeKindMap[K]);
    }

    for (const [key, value] of Object.entries(obj)) {
      if (key === 'parent') continue;
      if (typeof value === 'object' && value !== null) {
        walk(value);
      }
    }
  }

  walk(statements);
  return results;
}
