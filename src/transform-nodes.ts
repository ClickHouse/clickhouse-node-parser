import type {
  Statement,
  Expression,
  FromExpr,
  OrderByItem,
  ASTNodeKind,
  ASTNodeKindMap,
} from './ast';

/**
 * Maps each AST node `kind` to the union type that represents the position
 * where it can appear. This ensures that a visitor can only return a node type
 * compatible with the original node's position.
 */
export interface NodePositionMap {
  // Expression nodes
  literal: Expression;
  columnRef: Expression;
  functionCall: Expression;
  castExpr: Expression;
  lambdaExpr: Expression;
  binaryExpr: Expression;
  naryExpr: Expression;
  unaryExpr: Expression;
  asterisk: Expression;
  qualifiedAsterisk: Expression;
  tupleExpansion: Expression;
  queryParam: Expression;
  alias: Expression;
  array: Expression;
  tuple: Expression;
  subqueryExpr: Expression;
  inExpr: Expression;
  columnsExpr: Expression;
  jsonSubcolumn: Expression;

  // FROM clause nodes
  tableRef: FromExpr;
  subqueryFrom: FromExpr;
  tableFunction: FromExpr;
  join: FromExpr;
  arrayJoin: FromExpr;

  // ORDER BY nodes
  orderByItem: OrderByItem;

  // Statement nodes
  select: Statement;
  union: Statement;
  intersect: Statement;
  explain: Statement;
  set: Statement;
  use: Statement;
  system: Statement;
}

/**
 * Immutably transforms all AST nodes of the given `kind` by applying a
 * visitor function. Returns a new AST — the original is not modified.
 *
 * The visitor receives each matching node and returns a replacement that must
 * be compatible with the same position (e.g. an Expression node can only be
 * replaced with another Expression). The visitor is called bottom-up: children
 * are visited before their parents, so the visitor always sees
 * already-transformed subtrees.
 *
 * Only the paths from the root to changed nodes are shallow-copied; unchanged
 * subtrees are shared with the original AST.
 *
 * @example
 * ```ts
 * import { parse, transformNodes } from 'clickhouse-node-parser';
 *
 * const ast = parse('SELECT * FROM t WHERE id = {id:UInt64}');
 *
 * // Replace query parameters with literal values
 * const transformed = transformNodes(ast, 'queryParam', (node) => ({
 *   kind: 'literal',
 *   type: 'UInt64',
 *   value: '42',
 * }));
 * ```
 */
export function transformNodes<K extends ASTNodeKind>(
  statements: Statement[],
  kind: K,
  visitor: (node: ASTNodeKindMap[K]) => NodePositionMap[K],
): Statement[] {
  function walkChildren(obj: Record<string, unknown>): Record<string, unknown> {
    let copy: Record<string, unknown> | undefined;

    for (const key of Object.keys(obj)) {
      if (key === 'parent') continue;
      const value = obj[key];
      if (typeof value === 'object' && value !== null) {
        const transformed = walk(value);
        if (transformed !== value) {
          if (!copy) copy = { ...obj };
          copy[key] = transformed;
        }
      }
    }

    return copy ?? obj;
  }

  function walk(node: unknown): unknown {
    if (node === null || node === undefined || typeof node !== 'object') {
      return node;
    }

    if (Array.isArray(node)) {
      let copy: unknown[] | undefined;
      for (let i = 0; i < node.length; i++) {
        const transformed = walk(node[i]);
        if (transformed !== node[i]) {
          if (!copy) copy = node.slice();
          copy[i] = transformed;
        }
      }
      return copy ?? node;
    }

    const obj = node as Record<string, unknown>;

    // Bottom-up: recurse into children first
    const withChildren = walkChildren(obj);

    // Visit matching AST nodes
    if (obj.kind === kind) {
      const visited = visitor(withChildren as ASTNodeKindMap[K]) as Record<string, unknown>;
      return visited === withChildren && withChildren === obj ? obj : visited;
    }

    return withChildren;
  }

  return walk(statements) as Statement[];
}
