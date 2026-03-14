import { z } from 'zod';

// ── Source location ──────────────────────────────────────────────────────────

/**
 * Source location range from the original SQL input.
 * Compatible with peggy's `LocationRange`.
 */
export type SourceLocation = {
  start: { offset: number; line: number; column: number };
  end: { offset: number; line: number; column: number };
};

/** Zod schema for {@link SourceLocation}. */
export const SourceLocationSchema = z.object({
  start: z.object({ offset: z.number(), line: z.number(), column: z.number() }),
  end: z.object({ offset: z.number(), line: z.number(), column: z.number() }),
});

// ── Leaf schemas (no recursion) ───────────────────────────────────────────────

const ExprCommentFields = {
  leadingComments: z.array(z.string()).optional(),
  trailingComments: z.array(z.string()).optional(),
  location: SourceLocationSchema.optional(),
  parent: z.any().optional(),
};

/**
 * Zod schema for {@link Literal}.
 */
export const LiteralSchema = z.object({
  kind: z.literal('literal'),
  type: z.union([
    z.literal('UInt64'),
    z.literal('Int64'),
    z.literal('Float64'),
    z.literal('String'),
    z.literal('NULL'),
    z.literal('Bool'),
  ]),
  value: z.string(),
  source: z.string().optional(),
  parenthesized: z.boolean().optional(),
  ...ExprCommentFields,
});

/**
 * Zod schema for {@link ColumnRef}.
 */
export const ColumnRefSchema = z.object({
  kind: z.literal('columnRef'),
  parts: z.array(z.string()),
  parenthesized: z.boolean().optional(),
  ...ExprCommentFields,
});

/**
 * A single ratio value used in SAMPLE clauses.
 *
 * @example Fraction form: `SAMPLE 1/10` → `{ num: '1', den: '10' }`
 * @example Simple number: `SAMPLE 0.1` → `{ num: '0.1' }`
 */
export type SampleRatioValue = {
  /** The numerator (or the entire value for non-fraction form). */
  num: string;
  /** The denominator, present only for fraction form (e.g. `1/10`). */
  den?: string;
};

/**
 * A SAMPLE clause on a table reference.
 *
 * @example `SAMPLE 1/10` → `{ ratio: { num: '1', den: '10' } }`
 * @example `SAMPLE 1/10 OFFSET 1/2` → `{ ratio: { num: '1', den: '10' }, offset: { num: '1', den: '2' } }`
 */
export type SampleClause = {
  /** The sample ratio. */
  ratio: SampleRatioValue;
  /** Optional offset ratio for the sample. */
  offset?: SampleRatioValue;
};

/** Zod schema for {@link SampleRatioValue}. */
export const SampleRatioValueSchema = z.object({
  num: z.string(),
  den: z.string().optional(),
});

/** Zod schema for {@link SampleClause}. */
export const SampleClauseSchema = z.object({
  ratio: SampleRatioValueSchema,
  offset: SampleRatioValueSchema.optional(),
});

/**
 * Zod schema for {@link TableRef}.
 */
export const TableRefSchema = z.object({
  kind: z.literal('tableRef'),
  database: z.string().optional(),
  table: z.string(),
  alias: z.string().optional(),
  final: z.boolean().optional(),
  sample: SampleClauseSchema.optional(),
  leadingComments: z.array(z.string()).optional(),
  trailingComments: z.array(z.string()).optional(),
  location: SourceLocationSchema.optional(),
  parent: z.any().optional(),
});

/**
 * A column transformer: EXCEPT, APPLY, or REPLACE modifier applied to
 * `*`, `qualifier.*`, or `COLUMNS(...)`.
 *
 * @example `* EXCEPT (id)` → `{ kind: 'except', columns: ['id'] }`
 * @example `* APPLY (toString)` → `{ kind: 'apply', func: { kind: 'columnRef', parts: ['toString'] } }`
 * @example `* REPLACE (a + 1 AS a)` → `{ kind: 'replace', items: [{ expr: ..., alias: 'a' }] }`
 */
export type ColumnTransformer =
  | {
      /** Excludes specific columns from the wildcard expansion. */
      kind: 'except';
      /** Column names to exclude. */
      columns: string[];
      /** Whether STRICT keyword was used (error if column doesn't exist). */
      strict?: boolean;
      /** Whether the column name is a regex pattern. */
      pattern?: boolean;
    }
  | {
      /** Applies a function to each column in the wildcard expansion. */
      kind: 'apply';
      /** The function to apply. */
      func: Expression;
    }
  | {
      /** Replaces specific columns with computed expressions. */
      kind: 'replace';
      /** Replacement expressions with their target column aliases. */
      items: { expr: Expression; alias: string }[];
      /** Whether STRICT keyword was used. */
      strict?: boolean;
    };

/** Zod schema for {@link ColumnTransformer}. */
export const ColumnTransformerSchema: z.ZodType<ColumnTransformer> = z.lazy(() =>
  z.union([
    z.object({
      kind: z.literal('except'),
      columns: z.array(z.string()),
      strict: z.boolean().optional(),
      pattern: z.boolean().optional(),
    }),
    z.object({
      kind: z.literal('apply'),
      func: ExpressionSchema,
    }),
    z.object({
      kind: z.literal('replace'),
      items: z.array(z.object({ expr: ExpressionSchema, alias: z.string() })),
      strict: z.boolean().optional(),
    }),
  ]),
);

/** Zod schema for {@link Asterisk}. */
export const AsteriskSchema: z.ZodType<Asterisk> = z.lazy(() =>
  z.object({
    kind: z.literal('asterisk'),
    transformers: z.array(ColumnTransformerSchema).optional(),
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link QualifiedAsterisk}. */
export const QualifiedAsteriskSchema: z.ZodType<QualifiedAsterisk> = z.lazy(() =>
  z.object({
    kind: z.literal('qualifiedAsterisk'),
    parts: z.array(z.string()),
    transformers: z.array(ColumnTransformerSchema).optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link QueryParam}. */
export const QueryParamSchema = z.object({
  kind: z.literal('queryParam'),
  name: z.string(),
  type: z.string(),
  ...ExprCommentFields,
});

/** Zod schema for {@link TupleExpansion}. */
export const TupleExpansionSchema: z.ZodType<TupleExpansion> = z.lazy(() =>
  z.object({
    kind: z.literal('tupleExpansion'),
    expr: ExpressionSchema,
    transformers: z.array(ColumnTransformerSchema).optional(),
    ...ExprCommentFields,
  }),
);

// ── Recursive expression types ────────────────────────────────────────────────
// TypeScript types must be declared explicitly because z.infer cannot resolve
// recursive schemas without an explicit type annotation.

/**
 * A literal value: number, string, NULL, or boolean.
 *
 * The `value` field is always a string representation of the literal.
 * The `type` field indicates how to interpret it.
 *
 * @example `42` → `{ kind: 'literal', type: 'UInt64', value: '42' }`
 * @example `'hello'` → `{ kind: 'literal', type: 'String', value: 'hello' }`
 * @example `NULL` → `{ kind: 'literal', type: 'NULL', value: 'NULL' }`
 * @example `true` → `{ kind: 'literal', type: 'Bool', value: 'true' }`
 * @example `-3.14` → `{ kind: 'literal', type: 'Float64', value: '-3.14' }`
 */
export type Literal = z.infer<typeof LiteralSchema>;

/**
 * A column reference, optionally qualified with database/table names.
 *
 * All qualifier parts are stored as a flat array in `parts`, including the
 * final column name.
 *
 * @example `col` → `{ kind: 'columnRef', parts: ['col'] }`
 * @example `t.col` → `{ kind: 'columnRef', parts: ['t', 'col'] }`
 * @example `db.t.col` → `{ kind: 'columnRef', parts: ['db', 't', 'col'] }`
 */
export type ColumnRef = z.infer<typeof ColumnRefSchema>;

/**
 * A table reference in a FROM clause.
 *
 * @example `system.one` → `{ kind: 'tableRef', database: 'system', table: 'one' }`
 * @example `t FINAL` → `{ kind: 'tableRef', table: 't', final: true }`
 * @example `t AS alias` → `{ kind: 'tableRef', table: 't', alias: 'alias' }`
 */
export type TableRef = z.infer<typeof TableRefSchema>;

/**
 * Bare `*` wildcard, with optional column transformers (EXCEPT, APPLY, REPLACE).
 *
 * @example `*` → `{ kind: 'asterisk' }`
 * @example `* EXCEPT (id)` → `{ kind: 'asterisk', transformers: [{ kind: 'except', columns: ['id'] }] }`
 */
export type Asterisk = {
  kind: 'asterisk';
  transformers?: ColumnTransformer[];
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * Qualified `table.*` or `db.table.*` wildcard, with optional column transformers.
 *
 * `parts` contains all qualifier segments before the `*`.
 *
 * @example `t.*` → `{ kind: 'qualifiedAsterisk', parts: ['t'] }`
 * @example `db.t.*` → `{ kind: 'qualifiedAsterisk', parts: ['db', 't'] }`
 */
export type QualifiedAsterisk = {
  kind: 'qualifiedAsterisk';
  /** Qualifier parts before the `*`, e.g. `['system', 'one']` for `system.one.*`. */
  parts: string[];
  /** Optional column transformers (EXCEPT, APPLY, REPLACE). */
  transformers?: ColumnTransformer[];
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A query parameter placeholder: `{name:Type}`.
 *
 * Used in parameterized queries where values are substituted at execution time.
 *
 * @example `{x:UInt64}` → `{ kind: 'queryParam', name: 'x', type: 'UInt64' }`
 */
export type QueryParam = z.infer<typeof QueryParamSchema>;

/**
 * Tuple expansion: `expr.*` — expands all fields of a tuple expression.
 *
 * Different from {@link QualifiedAsterisk} which has named qualifier parts;
 * here the qualifier is an arbitrary expression.
 *
 * @example `tuple(1, 'a').*` → `{ kind: 'tupleExpansion', expr: { kind: 'functionCall', name: 'tuple', ... } }`
 */
export type TupleExpansion = {
  kind: 'tupleExpansion';
  /** The expression whose tuple fields are expanded. */
  expr: Expression;
  /** Optional column transformers (EXCEPT, APPLY, REPLACE). */
  transformers?: ColumnTransformer[];
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * The type of JOIN operation.
 *
 * - `'INNER'` — only matching rows from both sides
 * - `'LEFT'` — all rows from left, matching from right
 * - `'RIGHT'` — all rows from right, matching from left
 * - `'FULL'` — all rows from both sides
 * - `'CROSS'` — cartesian product (no join condition)
 * - `'PASTE'` — ClickHouse-specific: combines rows by position
 */
export type JoinType = 'INNER' | 'LEFT' | 'RIGHT' | 'FULL' | 'CROSS' | 'PASTE';

/**
 * The type of ARRAY JOIN operation.
 *
 * - `'ARRAY'` — unfolds array columns into rows (removes rows with empty arrays)
 * - `'LEFT ARRAY'` — like ARRAY but keeps rows with empty arrays (fills with defaults)
 */
export type ArrayJoinType = 'ARRAY' | 'LEFT ARRAY';

/**
 * A column in a USING clause: either a plain column name or a column
 * name with an alias (when the column name differs between the two tables).
 *
 * @example `USING (id)` → `'id'`
 * @example `USING (id AS other_id)` → `{ name: 'id', alias: 'other_id' }`
 */
export type UsingColumn = string | { name: string; alias: string };

/**
 * A JOIN constraint: either ON (with an expression) or USING (with column names).
 *
 * @example `ON a.id = b.id` → `{ kind: 'on', expr: ... }`
 * @example `USING (id, name)` → `{ kind: 'using', columns: ['id', 'name'] }`
 */
export type JoinConstraint =
  | { kind: 'on'; expr: Expression }
  | { kind: 'using'; columns: UsingColumn[] };

/**
 * A bound in a window frame specification.
 *
 * - `'unbounded'` — `UNBOUNDED PRECEDING` or `UNBOUNDED FOLLOWING`
 * - `'currentRow'` — `CURRENT ROW`
 * - `'preceding'` — `N PRECEDING`
 * - `'following'` — `N FOLLOWING`
 */
export type WindowFrameBound =
  | { kind: 'unbounded' }
  | { kind: 'currentRow' }
  | { kind: 'preceding'; expr: Expression }
  | { kind: 'following'; expr: Expression };

/**
 * A window specification for window functions.
 *
 * @example `OVER (PARTITION BY a ORDER BY b ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)`
 */
export type WindowSpec = {
  /** Expressions to partition the window by. */
  partitionBy?: Expression[];
  /** Ordering within each partition. */
  orderBy?: OrderByItem[];
  /** Window frame definition (ROWS, RANGE, or GROUPS with bounds). */
  frame?: {
    /** The frame type: `'rows'`, `'range'`, or `'groups'`. */
    frameType: 'rows' | 'range' | 'groups';
    /** The start bound of the frame. */
    start: WindowFrameBound;
    /** The end bound of the frame (if BETWEEN syntax is used). */
    end?: WindowFrameBound;
  };
};

/**
 * A function call expression.
 *
 * @example `count()` → `{ kind: 'functionCall', name: 'count', args: [] }`
 * @example `quantile(0.5)(x)` → `{ kind: 'functionCall', name: 'quantile', params: [...], args: [...] }`
 * @example `count() OVER (PARTITION BY a)` → `{ kind: 'functionCall', name: 'count', args: [], window: { partitionBy: [...] } }`
 */
export type FunctionCall = {
  kind: 'functionCall';
  /** The function name (always lowercase as returned by the parser). */
  name: string;
  /** Parametric arguments — the first `(...)` in `func(params)(args)` syntax. */
  params?: Expression[];
  /** Function arguments. */
  args: Expression[];
  /** Function-level SETTINGS, e.g. `func(x SETTINGS y=1)`. */
  funcSettings?: SettingItem[];
  /** Window specification when used as a window function. */
  window?: WindowSpec;
  /** Whether the entire function call was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A type cast expression: `CAST(expr AS Type)` or `expr::Type`.
 *
 * @example `CAST(x AS Int32)` → `{ kind: 'castExpr', expr: ..., type: 'Int32' }`
 * @example `x::String` → `{ kind: 'castExpr', expr: ..., type: 'String', operator: true }`
 */
export type CastExpr = {
  kind: 'castExpr';
  /** The expression being cast. */
  expr: Expression;
  /** The target type name. */
  type: string;
  /** `true` when created by `::` operator syntax (e.g. `42::Int32`), absent for `CAST(x AS T)`. */
  operator?: boolean;
  /** Whether the cast expression was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A lambda expression: `(params) -> body`.
 *
 * @example `x -> x + 1` → `{ kind: 'lambdaExpr', params: ['x'], body: ... }`
 * @example `(x, y) -> x + y` → `{ kind: 'lambdaExpr', params: ['x', 'y'], body: ... }`
 */
export type LambdaExpr = {
  kind: 'lambdaExpr';
  /** Parameter names. */
  params: string[];
  /** The lambda body expression. */
  body: Expression;
  /** Whether the lambda was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A subquery used as an expression: `(SELECT ...)`.
 *
 * @example `SELECT * WHERE id IN (SELECT id FROM other)` — the `(SELECT id FROM other)` part.
 */
export type SubqueryExpr = {
  kind: 'subqueryExpr';
  /** The query inside the subquery. */
  query: QueryStatement;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * An IN expression: `expr [NOT] IN (values)` or `expr [GLOBAL] [NOT] IN (subquery)`.
 *
 * @example `x IN (1, 2, 3)` → `{ kind: 'inExpr', negated: false, expr: ..., values: [...] }`
 * @example `x NOT IN (SELECT ...)` → `{ kind: 'inExpr', negated: true, expr: ..., values: { kind: 'subqueryExpr', ... } }`
 * @example `x GLOBAL IN (1)` → `{ kind: 'inExpr', negated: false, global: true, expr: ..., values: [...] }`
 */
export type InExpr = {
  kind: 'inExpr';
  /** Whether this is a NOT IN expression. */
  negated: boolean;
  /** Whether this is a GLOBAL IN expression (ClickHouse distributed query feature). */
  global?: boolean;
  /** The left-hand expression being tested. */
  expr: Expression;
  /** The right-hand values: an array of expressions for literal lists, or a subquery. */
  values: Expression[] | SubqueryExpr;
  /** Whether the IN expression was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A unary NOT expression.
 *
 * @example `NOT x` → `{ kind: 'unaryExpr', op: 'NOT', expr: ... }`
 */
export type UnaryExpr = {
  kind: 'unaryExpr';
  /** Always `'NOT'`. */
  op: 'NOT';
  /** The operand expression. */
  expr: Expression;
  /** Whether the NOT expression was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * Binary operators that produce {@link BinaryExpr} nodes.
 *
 * Note: `AND` and `OR` are not included — they always produce {@link NaryExpr} with 2+ operands.
 */
export type BinaryOp =
  | '<=>'
  | '>='
  | '<='
  | '<>'
  | '!='
  | '=='
  | '>'
  | '<'
  | '='
  | 'IS DISTINCT FROM'
  | '+'
  | '-'
  | '*'
  | '/'
  | '%'
  | 'DIV'
  | 'MOD';

/**
 * A binary expression: `left op right`.
 *
 * @example `a + b` → `{ kind: 'binaryExpr', op: '+', left: ..., right: ... }`
 * @example `x = 1` → `{ kind: 'binaryExpr', op: '=', left: ..., right: ... }`
 */
export type BinaryExpr = {
  kind: 'binaryExpr';
  /** The binary operator. */
  op: BinaryOp;
  /** The left operand. */
  left: Expression;
  /** The right operand. */
  right: Expression;
  /** Whether the binary expression was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * An n-ary AND/OR expression with a flat list of operands (always 2+).
 *
 * Chained `AND`/`OR` expressions are flattened into a single node rather than
 * nested binary trees, e.g. `a AND b AND c` produces one NaryExpr with 3 operands.
 *
 * @example `a AND b AND c` → `{ kind: 'naryExpr', op: 'AND', operands: [a, b, c] }`
 * @example `x OR y` → `{ kind: 'naryExpr', op: 'OR', operands: [x, y] }`
 */
export type NaryExpr = {
  kind: 'naryExpr';
  /** The logical operator: `'AND'` or `'OR'`. */
  op: 'AND' | 'OR';
  /** The operand expressions (always 2 or more). */
  operands: Expression[];
  /** Whether the expression was wrapped in parentheses in the source. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * An aliased expression: `expr AS name`.
 *
 * @example `count() AS cnt` → `{ kind: 'alias', expr: { kind: 'functionCall', name: 'count', ... }, alias: 'cnt' }`
 */
export type Alias = {
  kind: 'alias';
  /** The underlying expression. */
  expr: Expression;
  /** The alias name. */
  alias: string;
  /** `true` when the alias was wrapped in parentheses, e.g. `('abc' AS s)`. */
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * An array literal: `[a, b, c]`.
 *
 * @example `[1, 2, 3]` → `{ kind: 'array', elements: [...] }`
 */
export type ArrayLiteral = {
  kind: 'array';
  /** The array elements. */
  elements: Expression[];
  /** Original source text, used by the formatter for round-tripping when the elements can't be reconstructed. */
  source?: string;
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A tuple literal: `(a, b, c)`.
 *
 * Tuples with 2+ elements are represented here. Single-element parenthesized
 * expressions are represented by their inner expression with `parenthesized: true`.
 *
 * @example `(1, 'a', 3.14)` → `{ kind: 'tuple', elements: [...] }`
 */
export type TupleLiteral = {
  kind: 'tuple';
  /** The tuple elements. */
  elements: Expression[];
  /** Original source text, used by the formatter for round-tripping when the elements can't be reconstructed. */
  source?: string;
  parenthesized?: boolean;
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * A COLUMNS expression: `COLUMNS('pattern')` or `COLUMNS(col1, col2, ...)`.
 *
 * ClickHouse-specific expression that matches multiple columns at once.
 *
 * @example `COLUMNS('abc')` → `{ kind: 'columnsExpr', args: [{ kind: 'literal', type: 'String', value: 'abc' }] }`
 * @example `t.COLUMNS(a, b)` → `{ kind: 'columnsExpr', qualifier: 't', args: [...] }`
 * @example `COLUMNS('a') APPLY (toString)` → `{ kind: 'columnsExpr', args: [...], transformers: [...] }`
 */
export type ColumnsExpr = {
  kind: 'columnsExpr';
  /** Optional table qualifier, e.g. `'t'` in `t.COLUMNS(...)`. */
  qualifier?: string;
  /** Arguments to COLUMNS: a regex pattern string or column expressions. */
  args: Expression[];
  /** Optional column transformers (EXCEPT, APPLY, REPLACE). */
  transformers?: ColumnTransformer[];
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * ClickHouse JSON type annotation syntax: `expr.:Type` or `expr.:"ComplexType"`.
 *
 * Used to read a JSON subcolumn as a specific type.
 *
 * @example `json.field.:Int64` → `{ kind: 'jsonSubcolumn', expr: ..., type: 'Int64' }`
 * @example `col.:Array(JSON).d` → `{ kind: 'jsonSubcolumn', expr: ..., type: 'Array(JSON)', path: ['d'] }`
 */
export type JsonSubcolumn = {
  kind: 'jsonSubcolumn';
  /** The base expression to access the JSON subcolumn from. */
  expr: Expression;
  /** The target type annotation. */
  type: string;
  /** Optional further field accesses after the type annotation, e.g. `['d']` in `col.:Array(JSON).d`. */
  path?: string[];
  leadingComments?: string[];
  trailingComments?: string[];
  location?: SourceLocation;
  parent?: ASTNode;
};

/**
 * Union of all expression node types in the AST.
 *
 * Use the `kind` field to discriminate between variants.
 */
export type Expression =
  | Literal
  | ColumnRef
  | FunctionCall
  | CastExpr
  | LambdaExpr
  | BinaryExpr
  | NaryExpr
  | UnaryExpr
  | Asterisk
  | QualifiedAsterisk
  | TupleExpansion
  | QueryParam
  | Alias
  | ArrayLiteral
  | TupleLiteral
  | SubqueryExpr
  | InExpr
  | ColumnsExpr
  | JsonSubcolumn;

/**
 * Zod schema for {@link Expression}. Uses `z.lazy` for recursive references.
 */
export const ExpressionSchema: z.ZodType<Expression> = z.lazy(() =>
  z.union([
    LiteralSchema,
    ColumnRefSchema,
    FunctionCallSchema,
    CastExprSchema,
    LambdaExprSchema,
    BinaryExprSchema,
    NaryExprSchema,
    UnaryExprSchema,
    AsteriskSchema,
    QualifiedAsteriskSchema,
    TupleExpansionSchema,
    QueryParamSchema,
    AliasSchema,
    ArrayLiteralSchema,
    TupleLiteralSchema,
    SubqueryExprSchema,
    InExprSchema,
    ColumnsExprSchema,
    JsonSubcolumnSchema,
  ]),
);

/** Zod schema for {@link ColumnsExpr}. */
export const ColumnsExprSchema: z.ZodType<ColumnsExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('columnsExpr'),
    qualifier: z.string().optional(),
    args: z.array(ExpressionSchema),
    transformers: z.array(ColumnTransformerSchema).optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link JsonSubcolumn}. */
export const JsonSubcolumnSchema: z.ZodType<JsonSubcolumn> = z.lazy(() =>
  z.object({
    kind: z.literal('jsonSubcolumn'),
    expr: ExpressionSchema,
    type: z.string(),
    path: z.array(z.string()).optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link WindowFrameBound}. */
const WindowFrameBoundSchema: z.ZodType<WindowFrameBound> = z.lazy(() =>
  z.union([
    z.object({ kind: z.literal('unbounded') }),
    z.object({ kind: z.literal('currentRow') }),
    z.object({ kind: z.literal('preceding'), expr: ExpressionSchema }),
    z.object({ kind: z.literal('following'), expr: ExpressionSchema }),
  ]),
);

/** Zod schema for {@link WindowSpec}. */
const WindowSpecSchema: z.ZodType<WindowSpec> = z.lazy(() =>
  z.object({
    partitionBy: z.array(ExpressionSchema).optional(),
    orderBy: z.array(OrderByItemSchema).optional(),
    frame: z
      .object({
        frameType: z.union([z.literal('rows'), z.literal('range'), z.literal('groups')]),
        start: WindowFrameBoundSchema,
        end: WindowFrameBoundSchema.optional(),
      })
      .optional(),
  }),
);

/** Zod schema for {@link FunctionCall}. */
export const FunctionCallSchema: z.ZodType<FunctionCall> = z.lazy(() =>
  z.object({
    kind: z.literal('functionCall'),
    name: z.string(),
    params: z.array(ExpressionSchema).optional(),
    args: z.array(ExpressionSchema),
    funcSettings: z.array(SettingItemSchema).optional(),
    window: WindowSpecSchema.optional(),
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link CastExpr}. */
export const CastExprSchema: z.ZodType<CastExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('castExpr'),
    expr: ExpressionSchema,
    type: z.string(),
    operator: z.boolean().optional(),
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link LambdaExpr}. */
export const LambdaExprSchema: z.ZodType<LambdaExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('lambdaExpr'),
    params: z.array(z.string()),
    body: ExpressionSchema,
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link BinaryOp}. */
export const BinaryOpSchema = z.union([
  z.literal('<=>'),
  z.literal('>='),
  z.literal('<='),
  z.literal('<>'),
  z.literal('!='),
  z.literal('=='),
  z.literal('>'),
  z.literal('<'),
  z.literal('='),
  z.literal('IS DISTINCT FROM'),
  z.literal('+'),
  z.literal('-'),
  z.literal('*'),
  z.literal('/'),
  z.literal('%'),
  z.literal('DIV'),
  z.literal('MOD'),
]);

/** Zod schema for {@link BinaryExpr}. */
export const BinaryExprSchema: z.ZodType<BinaryExpr> = z.object({
  kind: z.literal('binaryExpr'),
  op: BinaryOpSchema,
  left: ExpressionSchema,
  right: ExpressionSchema,
  parenthesized: z.boolean().optional(),
  ...ExprCommentFields,
});

/** Zod schema for {@link NaryExpr}. */
export const NaryExprSchema: z.ZodType<NaryExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('naryExpr'),
    op: z.union([z.literal('AND'), z.literal('OR')]),
    operands: z.array(ExpressionSchema),
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link UnaryExpr}. */
export const UnaryExprSchema: z.ZodType<UnaryExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('unaryExpr'),
    op: z.literal('NOT'),
    expr: ExpressionSchema,
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link Alias}. */
export const AliasSchema: z.ZodType<Alias> = z.object({
  kind: z.literal('alias'),
  expr: ExpressionSchema,
  alias: z.string(),
  parenthesized: z.boolean().optional(),
  ...ExprCommentFields,
});

/** Zod schema for {@link ArrayLiteral}. */
export const ArrayLiteralSchema: z.ZodType<ArrayLiteral> = z.object({
  kind: z.literal('array'),
  elements: z.array(ExpressionSchema),
  source: z.string().optional(),
  parenthesized: z.boolean().optional(),
  ...ExprCommentFields,
});

/** Zod schema for {@link TupleLiteral}. */
export const TupleLiteralSchema: z.ZodType<TupleLiteral> = z.object({
  kind: z.literal('tuple'),
  elements: z.array(ExpressionSchema),
  source: z.string().optional(),
  parenthesized: z.boolean().optional(),
  ...ExprCommentFields,
});

/** Zod schema for {@link SubqueryExpr}. */
export const SubqueryExprSchema: z.ZodType<SubqueryExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('subqueryExpr'),
    query: QueryStatementSchema,
    ...ExprCommentFields,
  }),
);

/** Zod schema for {@link InExpr}. */
export const InExprSchema: z.ZodType<InExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('inExpr'),
    negated: z.boolean(),
    global: z.boolean().optional(),
    expr: ExpressionSchema,
    values: z.union([z.array(ExpressionSchema), SubqueryExprSchema]),
    parenthesized: z.boolean().optional(),
    ...ExprCommentFields,
  }),
);

/**
 * A single column in an INTERPOLATE clause.
 *
 * @example `INTERPOLATE (col AS col + 1)` → `{ col: 'col', expr: ... }`
 * @example `INTERPOLATE (col)` → `{ col: 'col' }` (uses default interpolation)
 */
export type InterpolateItem = {
  /** The column name to interpolate. */
  col: string;
  /** Optional expression defining how to compute the interpolated value. */
  expr?: Expression;
};

/**
 * A single item in an ORDER BY clause.
 *
 * @example `col ASC` → `{ kind: 'orderByItem', expr: ..., direction: 'ASC' }`
 * @example `col DESC COLLATE 'en'` → `{ kind: 'orderByItem', expr: ..., direction: 'DESC', collate: 'en' }`
 * @example `col ASC WITH FILL FROM 0 TO 100 STEP 10` → includes `fillFrom`, `fillTo`, `fillStep`
 */
export type OrderByItem = {
  kind: 'orderByItem';
  /** The expression to sort by. */
  expr: Expression;
  /** Sort direction. */
  direction: 'ASC' | 'DESC';
  /** Collation name for string sorting. */
  collate?: string;
  /** WITH FILL start value. */
  fillFrom?: Expression;
  /** WITH FILL end value. */
  fillTo?: Expression;
  /** WITH FILL step value. */
  fillStep?: Expression;
  /** WITH FILL staleness value. */
  fillStaleness?: Expression;
  /** INTERPOLATE clause items (attached to the last WITH FILL item in the ORDER BY). */
  interpolate?: InterpolateItem[];
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. */
  parent?: ASTNode;
};

/** Zod schema for {@link InterpolateItem}. */
const InterpolateItemSchema: z.ZodType<InterpolateItem> = z.lazy(() =>
  z.object({
    col: z.string(),
    expr: ExpressionSchema.optional(),
  }),
);

/** Zod schema for {@link OrderByItem}. */
export const OrderByItemSchema = z.object({
  kind: z.literal('orderByItem'),
  expr: ExpressionSchema,
  direction: z.union([z.literal('ASC'), z.literal('DESC')]),
  collate: z.string().optional(),
  fillFrom: ExpressionSchema.optional(),
  fillTo: ExpressionSchema.optional(),
  fillStep: ExpressionSchema.optional(),
  fillStaleness: ExpressionSchema.optional(),
  interpolate: z.array(InterpolateItemSchema).optional(),
  location: SourceLocationSchema.optional(),
  parent: z.any().optional(),
});

/** Zod schema for {@link SettingItem}. */
export const SettingItemSchema = z.lazy(() =>
  z.object({
    name: z.string(),
    value: ExpressionSchema,
  }),
);

/**
 * A single key-value setting: `name = value`.
 *
 * Used in SETTINGS clauses and function-level settings.
 *
 * @example `max_threads = 4` → `{ name: 'max_threads', value: { kind: 'literal', type: 'UInt64', value: '4' } }`
 */
export type SettingItem = {
  /** The setting name. */
  name: string;
  /** The setting value expression. */
  value: Expression;
};

/**
 * LIMIT BY clause: `LIMIT [offset,] count BY expr_list` or `LIMIT count BY ALL`.
 *
 * Limits rows per group defined by the BY expressions (or all groups with BY ALL).
 *
 * @example `LIMIT 5 BY user_id` → `{ count: ..., by: [{ kind: 'columnRef', parts: ['user_id'] }] }`
 * @example `LIMIT 2, 5 BY category` → `{ count: ..., by: [...], offset: ... }`
 * @example `LIMIT 1 BY ALL` → `{ count: ..., by: [] }`
 */
export type LimitByClause = {
  /** Maximum number of rows per group. */
  count: Expression;
  /** Group-by expressions. Empty array means `BY ALL`. */
  by: Expression[];
  /** Number of rows to skip per group before limiting. */
  offset?: Expression;
};

/** Zod schema for {@link LimitByClause}. */
export const LimitByClauseSchema: z.ZodType<LimitByClause> = z.lazy(() =>
  z.object({
    count: ExpressionSchema,
    by: z.array(ExpressionSchema),
    offset: ExpressionSchema.optional(),
  }),
);

/**
 * LIMIT clause: `LIMIT count [WITH TIES]`.
 *
 * When `commaSyntax` is true, the original SQL used `LIMIT count, offset` syntax
 * (the offset is stored in {@link SelectStatement.offset}). This flag affects
 * formatting and explain output ordering.
 *
 * @example `LIMIT 10` → `{ count: ... }`
 * @example `LIMIT 10 WITH TIES` → `{ count: ..., withTies: true }`
 * @example `LIMIT 10, 20` → `{ count: ..., commaSyntax: true }` (offset stored separately)
 */
export type LimitClause = {
  /** Maximum number of rows to return. */
  count: Expression;
  /**
   * `true` when `LIMIT count, offset` comma syntax was used.
   * Affects formatting order and explain output (limit before offset instead of after).
   */
  commaSyntax?: boolean;
  /** Whether `WITH TIES` was specified (return additional rows that tie with the last row). */
  withTies?: boolean;
};

/** Zod schema for {@link LimitClause}. */
export const LimitClauseSchema: z.ZodType<LimitClause> = z.lazy(() =>
  z.object({
    count: ExpressionSchema,
    commaSyntax: z.boolean().optional(),
    withTies: z.boolean().optional(),
  }),
);

/**
 * GROUP BY clause — a discriminated union of three mutually exclusive variants.
 *
 * - `'expressions'` — standard `GROUP BY col1, col2, ...`
 * - `'groupingSets'` — `GROUP BY GROUPING SETS ((a), (a, b), ())`
 * - `'all'` — `GROUP BY ALL` (groups by all non-aggregate columns)
 *
 * Note: WITH TOTALS, WITH CUBE, and WITH ROLLUP modifiers are stored as
 * separate flags on {@link SelectStatement}, not on this type, because they
 * can appear without a GROUP BY clause.
 *
 * @example `GROUP BY a, b` → `{ kind: 'expressions', items: [a, b] }`
 * @example `GROUP BY GROUPING SETS ((a), (a, b))` → `{ kind: 'groupingSets', sets: [[a], [a, b]] }`
 * @example `GROUP BY ALL` → `{ kind: 'all' }`
 */
export type GroupByClause =
  | { kind: 'expressions'; items: Expression[] }
  | { kind: 'groupingSets'; sets: Expression[][] }
  | { kind: 'all' };

/** Zod schema for {@link GroupByClause}. */
export const GroupByClauseSchema: z.ZodType<GroupByClause> = z.lazy(() =>
  z.union([
    z.object({ kind: z.literal('expressions'), items: z.array(ExpressionSchema) }),
    z.object({ kind: z.literal('groupingSets'), sets: z.array(z.array(ExpressionSchema)) }),
    z.object({ kind: z.literal('all') }),
  ]),
);

/**
 * DISTINCT clause — a discriminated union of two variants.
 *
 * - `'distinct'` — standard `SELECT DISTINCT ...`
 * - `'distinctOn'` — PostgreSQL-style `SELECT DISTINCT ON (col1, col2) ...`
 *
 * @example `SELECT DISTINCT col` → `{ kind: 'distinct' }`
 * @example `SELECT DISTINCT ON (a, b) col` → `{ kind: 'distinctOn', on: [a, b] }`
 */
export type DistinctClause = { kind: 'distinct' } | { kind: 'distinctOn'; on: Expression[] };

/** Zod schema for {@link DistinctClause}. */
export const DistinctClauseSchema: z.ZodType<DistinctClause> = z.union([
  z.object({ kind: z.literal('distinct') }),
  z.object({ kind: z.literal('distinctOn'), on: z.array(ExpressionSchema) }),
]);

// ── Trailing output clauses shared by query-type statements ──────────────────

/**
 * Trailing output clauses that can appear after any query-type statement at the
 * top level. These control output destination and formatting.
 *
 * ClickHouse allows up to three SETTINGS clauses in a single statement:
 * 1. Query-body SETTINGS (on {@link SelectStatement.settings}) — query execution settings
 * 2. Pre-format SETTINGS ({@link preFormatSettings}) — between query body and FORMAT
 * 3. Post-format SETTINGS ({@link postFormatSettings}) — after FORMAT clause
 *
 * @example `SELECT 1 INTO OUTFILE '/tmp/out' FORMAT TSV`
 * @example `SELECT 1 SETTINGS max_block_size=1 FORMAT TSV SETTINGS max_block_size=3`
 */
/**
 * Comment fields that can appear on any top-level statement.
 * Leading comments appear before the statement; trailing comments appear after.
 */
export type CommentFields = {
  /** Comments appearing before this statement. Each string is the full comment text including delimiters. */
  leadingComments?: string[];
  /** Comments appearing on the same line as the end of this statement (inline trailing). */
  trailingComments?: string[];
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. */
  parent?: ASTNode;
};

export type TrailingClauses = {
  /** Output file path: `INTO OUTFILE '/path/to/file'`. */
  intoOutfile?: Literal;
  /** SETTINGS clause appearing before FORMAT (between query body and FORMAT). */
  preFormatSettings?: SettingItem[];
  /** Output format name: `FORMAT TSV`, `FORMAT JSON`, etc. */
  format?: string;
  /** SETTINGS clause appearing after FORMAT (output formatting settings). */
  postFormatSettings?: SettingItem[];
};

// ── Mutually recursive statement types ───────────────────────────────────────

/**
 * A subquery used as a FROM source: `(SELECT ...) AS alias`.
 *
 * @example `FROM (SELECT 1) AS t` → `{ kind: 'subqueryFrom', query: ..., alias: 't' }`
 * @example `FROM (SELECT 1) AS t (a, b)` → includes `columnAliases: ['a', 'b']`
 */
export type SubqueryFrom = {
  kind: 'subqueryFrom';
  /** The subquery. */
  query: QueryStatement;
  /** Optional table alias. */
  alias?: string;
  /** Column aliases: `(a, b, c)` after the table alias, e.g. `(SELECT ...) AS x (a, b)`. */
  columnAliases?: string[];
  /** Whether FINAL modifier was applied. */
  final?: boolean;
  /** Optional SAMPLE clause. */
  sample?: SampleClause;
  /** Comments appearing before this node. */
  leadingComments?: string[];
  /** Comments appearing after this node on the same line. */
  trailingComments?: string[];
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. */
  parent?: ASTNode;
};

/**
 * A table function reference in a FROM clause.
 *
 * @example `FROM numbers(10)` → `{ kind: 'tableFunction', name: 'numbers', args: [...] }`
 * @example `FROM remote('host', db, table) AS r` → includes `alias: 'r'`
 */
export type TableFunctionRef = {
  kind: 'tableFunction';
  /** The table function name. */
  name: string;
  /** Function arguments. */
  args: Expression[];
  /** Whether FINAL modifier was applied. */
  final?: boolean;
  /** Optional table alias. */
  alias?: string;
  /** Optional SAMPLE clause. */
  sample?: SampleClause;
  /** Optional function-level SETTINGS. */
  settings?: SettingItem[];
  /** Comments appearing before this node. */
  leadingComments?: string[];
  /** Comments appearing after this node on the same line. */
  trailingComments?: string[];
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. */
  parent?: ASTNode;
};

/**
 * A JOIN expression combining two FROM sources.
 *
 * @example `t1 INNER JOIN t2 ON t1.id = t2.id`
 * @example `t1 LEFT JOIN t2 USING (id)`
 * @example `t1 CROSS JOIN t2`
 */
export type JoinExpr = {
  kind: 'join';
  /** The type of join. */
  joinType: JoinType;
  /** The left side of the join. */
  left: FromExpr;
  /** The right side of the join. */
  right: TableRef | SubqueryFrom | TableFunctionRef;
  /** The join condition (ON or USING). Absent for CROSS and PASTE joins. */
  constraint?: JoinConstraint;
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. */
  parent?: ASTNode;
};

/**
 * An ARRAY JOIN expression: unfolds array columns into individual rows.
 *
 * @example `t ARRAY JOIN arr AS a` — unfolds `arr` into rows
 * @example `t LEFT ARRAY JOIN arr` — keeps rows where `arr` is empty
 */
export type ArrayJoinExpr = {
  kind: 'arrayJoin';
  /** `'ARRAY'` or `'LEFT ARRAY'`. */
  joinType: ArrayJoinType;
  /** The left side (table or prior joins). */
  left: FromExpr;
  /** The array expressions to unfold. */
  expressions: Expression[];
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. */
  parent?: ASTNode;
};

/**
 * Union of all FROM clause source types.
 *
 * Use the `kind` field to discriminate between variants.
 */
export type FromExpr = TableRef | SubqueryFrom | TableFunctionRef | JoinExpr | ArrayJoinExpr;

/**
 * A SELECT statement.
 *
 * @example `SELECT a, b FROM t WHERE x > 1 ORDER BY a LIMIT 10`
 */
export type SelectStatement = {
  kind: 'select';
  /** DISTINCT or DISTINCT ON clause. */
  distinct?: DistinctClause;
  /** Common Table Expressions (WITH clause). */
  with?: CTE[];
  /** Comments before the FROM keyword. */
  fromLeadingComments?: string[];
  /** The SELECT list expressions. */
  select: Expression[];
  /** The FROM clause source. */
  from?: FromExpr;
  /** ClickHouse PREWHERE filter (applied before reading data from storage). */
  prewhere?: Expression;
  /** WHERE filter expression. */
  where?: Expression;
  /** GROUP BY clause (expressions, grouping sets, or ALL). */
  groupBy?: GroupByClause;
  /** `true` when WITH TOTALS modifier is present (adds a totals row to the output). */
  withTotals?: boolean;
  /** `true` when WITH CUBE modifier is present (generates all grouping combinations). */
  withCube?: boolean;
  /** `true` when WITH ROLLUP modifier is present (generates hierarchical grouping subtotals). */
  withRollup?: boolean;
  /** HAVING filter expression (applied after GROUP BY). */
  having?: Expression;
  /** ORDER BY clause items. */
  orderBy?: OrderByItem[];
  /** LIMIT BY clause (limits rows per group). */
  limitBy?: LimitByClause;
  /** LIMIT clause (limits total rows returned). */
  limit?: LimitClause;
  /** Standalone OFFSET clause, or the offset from `LIMIT count, offset` comma syntax. */
  offset?: Expression;
  /** Named window definitions: `WINDOW name AS (spec)`. */
  windows?: { name: string; body: string }[];
  /** QUALIFY filter expression (applied after window functions). */
  qualify?: Expression;
  /** `true` when this SELECT was wrapped in parentheses, e.g. `(SELECT 1)` inside a UNION. */
  parenthesized?: boolean;
  /** Query execution settings: `SETTINGS key = value, ...` inside the query body. */
  settings?: SettingItem[];
} & TrailingClauses &
  CommentFields;

/**
 * A UNION ALL or UNION DISTINCT statement combining multiple queries.
 *
 * @example `SELECT 1 UNION ALL SELECT 2` → `{ kind: 'union', queries: [...] }`
 * @example `SELECT 1 UNION DISTINCT SELECT 2` → `{ kind: 'union', queries: [...], unionMode: 'DISTINCT' }`
 */
export type UnionStatement = {
  kind: 'union';
  /** The queries being unioned (always 2+). */
  queries: QueryStatement[];
  /** `'DISTINCT'` for UNION DISTINCT; absent for UNION ALL (the default). */
  unionMode?: 'DISTINCT';
  /** Query execution settings. */
  settings?: SettingItem[];
} & TrailingClauses &
  CommentFields;

/**
 * An INTERSECT or EXCEPT statement between two queries.
 *
 * @example `SELECT 1 INTERSECT SELECT 1` → `{ kind: 'intersect', op: 'INTERSECT', left: ..., right: ... }`
 * @example `SELECT 1 EXCEPT SELECT 2` → `{ kind: 'intersect', op: 'EXCEPT', left: ..., right: ... }`
 */
export type IntersectStatement = {
  kind: 'intersect';
  /** The set operation: `'INTERSECT'` or `'EXCEPT'`. */
  op: 'INTERSECT' | 'EXCEPT';
  /** The left query. */
  left: QueryStatement;
  /** The right query. */
  right: QueryStatement;
} & TrailingClauses &
  CommentFields;

/**
 * A Common Table Expression (CTE) in a WITH clause.
 *
 * - `'subquery'` — `WITH name AS (SELECT ...)` — names a subquery
 * - `'expr'` — `WITH expr AS name` — names an expression
 *
 * @example `WITH cte AS (SELECT 1)` → `{ kind: 'subquery', name: 'cte', query: ... }`
 * @example `WITH 42 AS answer` → `{ kind: 'expr', name: 'answer', expr: ... }`
 */
export type CTE = (
  | { kind: 'subquery'; name: string; query: QueryStatement }
  | { kind: 'expr'; name: string; expr: Expression }
) & { leadingComments?: string[]; trailingComments?: string[] };

/**
 * Union of statement types that produce query results. These can appear in
 * subqueries, CTEs, UNION members, and other contexts that expect a result set.
 */
export type QueryStatement =
  | SelectStatement
  | UnionStatement
  | IntersectStatement
  | ExplainStatement;

/**
 * An EXPLAIN statement: `EXPLAIN [type] [settings] query`.
 *
 * @example `EXPLAIN AST SELECT 1` → `{ kind: 'explain', explainType: 'AST', query: ... }`
 * @example `EXPLAIN QUERY TREE SELECT 1` → `{ kind: 'explain', explainType: 'QUERY TREE', query: ... }`
 * @example `EXPLAIN actions=1 SELECT 1` → `{ kind: 'explain', settings: [...], query: ... }`
 */
export type ExplainStatement = {
  kind: 'explain';
  /** The explain output type: `'AST'`, `'SYNTAX'`, `'QUERY TREE'`, `'PLAN'`, `'PIPELINE'`, etc. */
  explainType?: string;
  /** Explain-level settings (without SETTINGS keyword), e.g. `actions=1`. */
  settings?: SettingItem[];
  /** The query being explained. */
  query?: Statement;
} & TrailingClauses &
  CommentFields;

/**
 * A SET statement: `SET key = value [, key = value ...]`.
 *
 * Changes session-level settings.
 *
 * @example `SET max_threads = 4` → `{ kind: 'set', settings: [{ name: 'max_threads', value: ... }] }`
 */
export type SetStatement = {
  kind: 'set';
  /** The settings to set. */
  settings: SettingItem[];
} & CommentFields;

/**
 * A USE statement: `USE database` — selects the current database.
 *
 * @example `USE default` → `{ kind: 'use', database: 'default' }`
 */
export type UseStatement = {
  kind: 'use';
  /** The database name to switch to. */
  database: string;
} & CommentFields;

/**
 * A SYSTEM statement: `SYSTEM FLUSH LOGS`, `SYSTEM RELOAD CONFIG`, etc.
 *
 * The body is stored as raw text since these are admin commands whose internal
 * structure is not parsed.
 *
 * @example `SYSTEM FLUSH LOGS` → `{ kind: 'system', body: 'FLUSH LOGS' }`
 */
export type SystemStatement = {
  kind: 'system';
  /** The raw text of the SYSTEM command after the SYSTEM keyword. */
  body: string;
} & CommentFields;

/**
 * Union of all top-level statement types.
 *
 * Use the `kind` field to discriminate between variants.
 */
export type Statement =
  | QueryStatement
  | ExplainStatement
  | SetStatement
  | UseStatement
  | SystemStatement;

// ── AST node kind map ────────────────────────────────────────────────────────

/**
 * Maps each AST node `kind` string to its corresponding TypeScript type.
 *
 * Used by {@link findNodes} to provide type-safe return values.
 */
export interface ASTNodeKindMap {
  literal: Literal;
  columnRef: ColumnRef;
  tableRef: TableRef;
  asterisk: Asterisk;
  qualifiedAsterisk: QualifiedAsterisk;
  queryParam: QueryParam;
  tupleExpansion: TupleExpansion;
  functionCall: FunctionCall;
  castExpr: CastExpr;
  lambdaExpr: LambdaExpr;
  subqueryExpr: SubqueryExpr;
  inExpr: InExpr;
  unaryExpr: UnaryExpr;
  binaryExpr: BinaryExpr;
  naryExpr: NaryExpr;
  alias: Alias;
  array: ArrayLiteral;
  tuple: TupleLiteral;
  columnsExpr: ColumnsExpr;
  jsonSubcolumn: JsonSubcolumn;
  orderByItem: OrderByItem;
  subqueryFrom: SubqueryFrom;
  tableFunction: TableFunctionRef;
  join: JoinExpr;
  arrayJoin: ArrayJoinExpr;
  select: SelectStatement;
  union: UnionStatement;
  intersect: IntersectStatement;
  explain: ExplainStatement;
  set: SetStatement;
  use: UseStatement;
  system: SystemStatement;
}

/**
 * All valid AST node `kind` values.
 */
export type ASTNodeKind = keyof ASTNodeKindMap;

/**
 * Union of all AST node types. Every member has a `kind` discriminator field.
 */
export type ASTNode = ASTNodeKindMap[ASTNodeKind];

// ── Zod schemas for statement types ──────────────────────────────────────────

const CommentFieldsSchema = {
  leadingComments: z.array(z.string()).optional(),
  trailingComments: z.array(z.string()).optional(),
  location: SourceLocationSchema.optional(),
  parent: z.any().optional(),
};

const TrailingClausesFields = {
  intoOutfile: LiteralSchema.optional(),
  preFormatSettings: z.array(SettingItemSchema).optional(),
  format: z.string().optional(),
  postFormatSettings: z.array(SettingItemSchema).optional(),
};

/** Zod schema for {@link SelectStatement}. */
export const SelectStatementSchema: z.ZodType<SelectStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('select'),
    distinct: DistinctClauseSchema.optional(),
    with: z.array(CTESchema).optional(),
    fromLeadingComments: z.array(z.string()).optional(),
    select: z.array(ExpressionSchema),
    from: FromExprSchema.optional(),
    prewhere: ExpressionSchema.optional(),
    where: ExpressionSchema.optional(),
    groupBy: GroupByClauseSchema.optional(),
    withTotals: z.boolean().optional(),
    withCube: z.boolean().optional(),
    withRollup: z.boolean().optional(),
    having: ExpressionSchema.optional(),
    orderBy: z.array(OrderByItemSchema).optional(),
    limitBy: LimitByClauseSchema.optional(),
    limit: LimitClauseSchema.optional(),
    offset: ExpressionSchema.optional(),
    windows: z.array(z.object({ name: z.string(), body: z.string() })).optional(),
    qualify: ExpressionSchema.optional(),
    parenthesized: z.boolean().optional(),
    settings: z.array(SettingItemSchema).optional(),
    ...TrailingClausesFields,
    ...CommentFieldsSchema,
  }),
);

/** Zod schema for {@link UnionStatement}. */
export const UnionStatementSchema: z.ZodType<UnionStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('union'),
    queries: z.array(QueryStatementSchema),
    unionMode: z.literal('DISTINCT').optional(),
    settings: z.array(SettingItemSchema).optional(),
    ...TrailingClausesFields,
    ...CommentFieldsSchema,
  }),
);

/** Zod schema for {@link IntersectStatement}. */
export const IntersectStatementSchema: z.ZodType<IntersectStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('intersect'),
    op: z.union([z.literal('INTERSECT'), z.literal('EXCEPT')]),
    left: QueryStatementSchema,
    right: QueryStatementSchema,
    ...TrailingClausesFields,
    ...CommentFieldsSchema,
  }),
);

/** Zod schema for {@link CTE}. */
export const CTESchema: z.ZodType<CTE> = z.lazy(() =>
  z.union([
    z.object({
      kind: z.literal('subquery'),
      name: z.string(),
      query: QueryStatementSchema,
      ...ExprCommentFields,
    }),
    z.object({
      kind: z.literal('expr'),
      name: z.string(),
      expr: ExpressionSchema,
      ...ExprCommentFields,
    }),
  ]),
);

/** Zod schema for {@link SubqueryFrom}. */
export const SubqueryFromSchema: z.ZodType<SubqueryFrom> = z.lazy(() =>
  z.object({
    kind: z.literal('subqueryFrom'),
    query: QueryStatementSchema,
    alias: z.string().optional(),
    columnAliases: z.array(z.string()).optional(),
    final: z.boolean().optional(),
    sample: SampleClauseSchema.optional(),
    leadingComments: z.array(z.string()).optional(),
    trailingComments: z.array(z.string()).optional(),
    location: SourceLocationSchema.optional(),
    parent: z.any().optional(),
  }),
);

/** Zod schema for {@link TableFunctionRef}. */
export const TableFunctionRefSchema: z.ZodType<TableFunctionRef> = z.lazy(() =>
  z.object({
    kind: z.literal('tableFunction'),
    name: z.string(),
    args: z.array(ExpressionSchema),
    final: z.boolean().optional(),
    alias: z.string().optional(),
    sample: SampleClauseSchema.optional(),
    settings: z.array(SettingItemSchema).optional(),
    leadingComments: z.array(z.string()).optional(),
    trailingComments: z.array(z.string()).optional(),
    location: SourceLocationSchema.optional(),
    parent: z.any().optional(),
  }),
);

/** Zod schema for {@link JoinType}. */
export const JoinTypeSchema = z.union([
  z.literal('INNER'),
  z.literal('LEFT'),
  z.literal('RIGHT'),
  z.literal('FULL'),
  z.literal('CROSS'),
  z.literal('PASTE'),
]);

/** Zod schema for {@link ArrayJoinType}. */
export const ArrayJoinTypeSchema = z.union([z.literal('ARRAY'), z.literal('LEFT ARRAY')]);

/** Zod schema for {@link UsingColumn}. */
const UsingColumnSchema: z.ZodType<UsingColumn> = z.union([
  z.string(),
  z.object({ name: z.string(), alias: z.string() }),
]);

/** Zod schema for {@link JoinConstraint}. */
export const JoinConstraintSchema: z.ZodType<JoinConstraint> = z.lazy(() =>
  z.union([
    z.object({ kind: z.literal('on'), expr: ExpressionSchema }),
    z.object({ kind: z.literal('using'), columns: z.array(UsingColumnSchema) }),
  ]),
);

/** Zod schema for {@link FromExpr}. */
export const FromExprSchema: z.ZodType<FromExpr> = z.lazy(() =>
  z.union([
    TableRefSchema,
    SubqueryFromSchema,
    TableFunctionRefSchema,
    JoinExprSchema,
    ArrayJoinExprSchema,
  ]),
);

/** Zod schema for {@link JoinExpr}. */
export const JoinExprSchema: z.ZodType<JoinExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('join'),
    joinType: JoinTypeSchema,
    left: FromExprSchema,
    right: z.union([TableRefSchema, SubqueryFromSchema, TableFunctionRefSchema]),
    constraint: JoinConstraintSchema.optional(),
    location: SourceLocationSchema.optional(),
    parent: z.any().optional(),
  }),
);

/** Zod schema for {@link ArrayJoinExpr}. */
export const ArrayJoinExprSchema: z.ZodType<ArrayJoinExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('arrayJoin'),
    joinType: ArrayJoinTypeSchema,
    left: FromExprSchema,
    expressions: z.array(ExpressionSchema),
    location: SourceLocationSchema.optional(),
    parent: z.any().optional(),
  }),
);

/** Zod schema for {@link ExplainStatement}. */
export const ExplainStatementSchema: z.ZodType<ExplainStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('explain'),
    explainType: z.string().optional(),
    settings: z.array(SettingItemSchema).optional(),
    query: StatementSchema.optional(),
    ...TrailingClausesFields,
    ...CommentFieldsSchema,
  }),
);

/** Zod schema for {@link SetStatement}. */
export const SetStatementSchema: z.ZodType<SetStatement> = z.object({
  kind: z.literal('set'),
  settings: z.array(SettingItemSchema),
  ...CommentFieldsSchema,
});

/** Zod schema for {@link UseStatement}. */
export const UseStatementSchema: z.ZodType<UseStatement> = z.object({
  kind: z.literal('use'),
  database: z.string(),
  ...CommentFieldsSchema,
});

/** Zod schema for {@link SystemStatement}. */
export const SystemStatementSchema: z.ZodType<SystemStatement> = z.object({
  kind: z.literal('system'),
  body: z.string(),
  ...CommentFieldsSchema,
});

/** Zod schema for {@link QueryStatement}. */
export const QueryStatementSchema: z.ZodType<QueryStatement> = z.lazy(() =>
  z.union([
    SelectStatementSchema,
    UnionStatementSchema,
    IntersectStatementSchema,
    ExplainStatementSchema,
  ]),
);

/** Zod schema for {@link Statement}. */
export const StatementSchema: z.ZodType<Statement> = z.lazy(() =>
  z.union([
    SelectStatementSchema,
    UnionStatementSchema,
    IntersectStatementSchema,
    ExplainStatementSchema,
    SetStatementSchema,
    UseStatementSchema,
    SystemStatementSchema,
  ]),
);

/** Zod schema for an array of {@link Statement}s (the top-level parse result). */
export const StatementsSchema = z.array(StatementSchema);
