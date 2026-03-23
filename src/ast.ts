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

const ExprMetadataFields = {
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
  ...ExprMetadataFields,
});

/**
 * Zod schema for {@link ColumnRef}.
 */
export const ColumnRefSchema = z.object({
  kind: z.literal('columnRef'),
  parts: z.array(z.string()),
  parenthesized: z.boolean().optional(),
  ...ExprMetadataFields,
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
  ...ExprMetadataFields,
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
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link QualifiedAsterisk}. */
export const QualifiedAsteriskSchema: z.ZodType<QualifiedAsterisk> = z.lazy(() =>
  z.object({
    kind: z.literal('qualifiedAsterisk'),
    parts: z.array(z.string()),
    transformers: z.array(ColumnTransformerSchema).optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link QueryParam}. */
export const QueryParamSchema = z.object({
  kind: z.literal('queryParam'),
  name: z.string(),
  type: z.string(),
  ...ExprMetadataFields,
});

/** Zod schema for {@link TupleExpansion}. */
export const TupleExpansionSchema: z.ZodType<TupleExpansion> = z.lazy(() =>
  z.object({
    kind: z.literal('tupleExpansion'),
    expr: ExpressionSchema,
    transformers: z.array(ColumnTransformerSchema).optional(),
    ...ExprMetadataFields,
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
export type Literal = {
  kind: 'literal';
  type: 'UInt64' | 'Int64' | 'Float64' | 'String' | 'NULL' | 'Bool';
  value: string;
  source?: string;
  parenthesized?: boolean;
} & NodeMetadata;

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
export type ColumnRef = {
  kind: 'columnRef';
  parts: string[];
  parenthesized?: boolean;
} & NodeMetadata;

/**
 * A table reference in a FROM clause.
 *
 * @example `system.one` → `{ kind: 'tableRef', database: 'system', table: 'one' }`
 * @example `t FINAL` → `{ kind: 'tableRef', table: 't', final: true }`
 * @example `t AS alias` → `{ kind: 'tableRef', table: 't', alias: 'alias' }`
 */
export type TableRef = {
  kind: 'tableRef';
  database?: string;
  table: string;
  alias?: string;
  final?: boolean;
  sample?: SampleClause;
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

/**
 * A query parameter placeholder: `{name:Type}`.
 *
 * Used in parameterized queries where values are substituted at execution time.
 *
 * @example `{x:UInt64}` → `{ kind: 'queryParam', name: 'x', type: 'UInt64' }`
 */
export type QueryParam = {
  kind: 'queryParam';
  name: string;
  type: string;
} & NodeMetadata;

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
} & NodeMetadata;

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
  /** Base window name for window inheritance, e.g. `w1` in `WINDOW w2 AS (w1 ORDER BY x)`. */
  baseWindow?: string;
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
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

/**
 * A subquery used as an expression: `(SELECT ...)`.
 *
 * @example `SELECT * WHERE id IN (SELECT id FROM other)` — the `(SELECT id FROM other)` part.
 */
export type SubqueryExpr = {
  kind: 'subqueryExpr';
  /** The query inside the subquery. */
  query: QueryStatement;
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

/**
 * An array literal: `[a, b, c]`.
 *
 * @example `[1, 2, 3]` → `{ kind: 'arrayLiteral', elements: [...] }`
 */
export type ArrayLiteral = {
  kind: 'arrayLiteral';
  /** The array elements. */
  elements: Expression[];
  /** Original source text, used by the formatter for round-tripping when the elements can't be reconstructed. */
  source?: string;
  parenthesized?: boolean;
} & NodeMetadata;

/**
 * A tuple literal: `(a, b, c)`.
 *
 * Tuples with 2+ elements are represented here. Single-element parenthesized
 * expressions are represented by their inner expression with `parenthesized: true`.
 *
 * @example `(1, 'a', 3.14)` → `{ kind: 'tupleLiteral', elements: [...] }`
 */
export type TupleLiteral = {
  kind: 'tupleLiteral';
  /** The tuple elements. */
  elements: Expression[];
  /** Original source text, used by the formatter for round-tripping when the elements can't be reconstructed. */
  source?: string;
  parenthesized?: boolean;
} & NodeMetadata;

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
} & NodeMetadata;

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
} & NodeMetadata;

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
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link JsonSubcolumn}. */
export const JsonSubcolumnSchema: z.ZodType<JsonSubcolumn> = z.lazy(() =>
  z.object({
    kind: z.literal('jsonSubcolumn'),
    expr: ExpressionSchema,
    type: z.string(),
    path: z.array(z.string()).optional(),
    ...ExprMetadataFields,
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
    baseWindow: z.string().optional(),
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
    ...ExprMetadataFields,
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
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link LambdaExpr}. */
export const LambdaExprSchema: z.ZodType<LambdaExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('lambdaExpr'),
    params: z.array(z.string()),
    body: ExpressionSchema,
    parenthesized: z.boolean().optional(),
    ...ExprMetadataFields,
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
  ...ExprMetadataFields,
});

/** Zod schema for {@link NaryExpr}. */
export const NaryExprSchema: z.ZodType<NaryExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('naryExpr'),
    op: z.union([z.literal('AND'), z.literal('OR')]),
    operands: z.array(ExpressionSchema),
    parenthesized: z.boolean().optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link UnaryExpr}. */
export const UnaryExprSchema: z.ZodType<UnaryExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('unaryExpr'),
    op: z.literal('NOT'),
    expr: ExpressionSchema,
    parenthesized: z.boolean().optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link Alias}. */
export const AliasSchema: z.ZodType<Alias> = z.object({
  kind: z.literal('alias'),
  expr: ExpressionSchema,
  alias: z.string(),
  parenthesized: z.boolean().optional(),
  ...ExprMetadataFields,
});

/** Zod schema for {@link ArrayLiteral}. */
export const ArrayLiteralSchema: z.ZodType<ArrayLiteral> = z.object({
  kind: z.literal('arrayLiteral'),
  elements: z.array(ExpressionSchema),
  source: z.string().optional(),
  parenthesized: z.boolean().optional(),
  ...ExprMetadataFields,
});

/** Zod schema for {@link TupleLiteral}. */
export const TupleLiteralSchema: z.ZodType<TupleLiteral> = z.object({
  kind: z.literal('tupleLiteral'),
  elements: z.array(ExpressionSchema),
  source: z.string().optional(),
  parenthesized: z.boolean().optional(),
  ...ExprMetadataFields,
});

/** Zod schema for {@link SubqueryExpr}. */
export const SubqueryExprSchema: z.ZodType<SubqueryExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('subqueryExpr'),
    query: QueryStatementSchema,
    ...ExprMetadataFields,
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
    ...ExprMetadataFields,
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
} & NodeMetadata;

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
  ...ExprMetadataFields,
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
 * Metadata fields common to all AST nodes: comments, source location, and parent reference.
 */
export type NodeMetadata = {
  /** Comments appearing before this node. Each string is the full comment text including delimiters. */
  leadingComments?: string[];
  /** Comments appearing on the same line as the end of this node (inline trailing). */
  trailingComments?: string[];
  /** Source location in the original SQL input. */
  location?: SourceLocation;
  /** Reference to the parent AST node. Set by {@link setParents}. */
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
} & NodeMetadata;

/**
 * A table function reference in a FROM clause.
 *
 * @example `FROM numbers(10)` → `{ kind: 'tableFunctionRef', name: 'numbers', args: [...] }`
 * @example `FROM remote('host', db, table) AS r` → includes `alias: 'r'`
 */
export type TableFunctionRef = {
  kind: 'tableFunctionRef';
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
} & NodeMetadata;

/**
 * A JOIN expression combining two FROM sources.
 *
 * @example `t1 INNER JOIN t2 ON t1.id = t2.id`
 * @example `t1 LEFT JOIN t2 USING (id)`
 * @example `t1 CROSS JOIN t2`
 */
export type JoinExpr = {
  kind: 'joinExpr';
  /** The type of join. */
  joinType: JoinType;
  /** The left side of the join. */
  left: FromExpr;
  /** The right side of the join. */
  right: TableRef | SubqueryFrom | TableFunctionRef;
  /** The join condition (ON or USING). Absent for CROSS and PASTE joins. */
  constraint?: JoinConstraint;
} & NodeMetadata;

/**
 * An ARRAY JOIN expression: unfolds array columns into individual rows.
 *
 * @example `t ARRAY JOIN arr AS a` — unfolds `arr` into rows
 * @example `t LEFT ARRAY JOIN arr` — keeps rows where `arr` is empty
 */
export type ArrayJoinExpr = {
  kind: 'arrayJoinExpr';
  /** `'ARRAY'` or `'LEFT ARRAY'`. */
  joinType: ArrayJoinType;
  /** The left side (table or prior joins). */
  left: FromExpr;
  /** The array expressions to unfold. */
  expressions: Expression[];
} & NodeMetadata;

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
  windows?: { name: string; spec: WindowSpec }[];
  /** QUALIFY filter expression (applied after window functions). */
  qualify?: Expression;
  /** `true` when this SELECT was wrapped in parentheses, e.g. `(SELECT 1)` inside a UNION. */
  parenthesized?: boolean;
  /** Query execution settings: `SETTINGS key = value, ...` inside the query body. */
  settings?: SettingItem[];
} & TrailingClauses &
  NodeMetadata;

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
  NodeMetadata;

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
  NodeMetadata;

/**
 * A Common Table Expression (CTE) in a WITH clause.
 *
 * - `'cteSubquery'` — `WITH name AS (SELECT ...)` — names a subquery
 * - `'cteExpr'` — `WITH expr AS name` — names an expression
 *
 * @example `WITH cte AS (SELECT 1)` → `{ kind: 'cteSubquery', name: 'cte', query: ... }`
 * @example `WITH 42 AS answer` → `{ kind: 'cteExpr', name: 'answer', expr: ... }`
 */
export type CTESubquery = {
  kind: 'cteSubquery';
  name: string;
  query: QueryStatement;
} & NodeMetadata;

export type CTEExpr = {
  kind: 'cteExpr';
  name: string;
  expr: Expression;
} & NodeMetadata;

export type CTE = CTESubquery | CTEExpr;

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
  NodeMetadata;

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
  settings?: SettingItem[];
} & NodeMetadata;

// ── Role target ──────────────────────────────────────────────────────────────

/** A target clause for role/user specifications (TO ALL/NONE/names). */
export type RoleTarget =
  | { kind: 'all'; except?: string[] }
  | { kind: 'none' }
  | { kind: 'names'; names: string[] };

/** Default role clause (same structure as RoleTarget). */
export type DefaultRoleClause = RoleTarget;

/**
 * A SET TRANSACTION SNAPSHOT statement.
 *
 * @example `SET TRANSACTION SNAPSHOT 1` → `{ kind: 'transactionControl', snapshot: '1' }`
 */
export type TransactionControlStatement = {
  kind: 'transactionControl';
  /** The snapshot number. */
  snapshot: string;
} & NodeMetadata;

/**
 * A SET DEFAULT ROLE statement.
 *
 * @example `SET DEFAULT ROLE ALL TO u1` → `{ kind: 'setRole', roles: { kind: 'all' }, users: ['u1'] }`
 */
export type SetRoleStatement = {
  kind: 'setRole';
  /** The role specification. */
  roles: RoleTarget;
  /** The user names the role applies to. */
  users: string[];
} & NodeMetadata;

// ── Access control shared types ──────────────────────────────────────────────

/** Name with optional @'host' for access control entities. */
export type AccessControlName = { name: string; host?: string };

/** HOST specification items for CREATE USER. */
export type HostItem =
  | { kind: 'any' }
  | { kind: 'none' }
  | { kind: 'local' }
  | { kind: 'name'; value: string }
  | { kind: 'regexp'; value: string }
  | { kind: 'like'; value: string }
  | { kind: 'ip'; value: string };

/**
 * Access control SETTINGS items (different from query-level SettingItem).
 * Used in CREATE USER, CREATE ROLE, CREATE SETTINGS PROFILE.
 */
export type AccessControlSettingsItem =
  | { kind: 'profile'; name: string }
  | { kind: 'inherit'; name: string }
  | {
      kind: 'setting';
      name: string;
      value?: Expression;
      min?: Expression;
      max?: Expression;
      modifier?: 'CONST' | 'WRITABLE' | 'READONLY';
    };

/**
 * A USE statement: `USE database` — selects the current database.
 *
 * @example `USE default` → `{ kind: 'use', database: 'default' }`
 */
export type UseStatement = {
  kind: 'use';
  /** The database name to switch to. */
  database: string;
} & NodeMetadata;

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
} & NodeMetadata;

// ── CREATE TABLE types ───────────────────────────────────────────────────────

/**
 * A parsed ClickHouse data type, e.g. `Array(UInt8)`, `Nullable(String)`, `Enum8('a' = 1)`.
 *
 * @example `{ name: 'Array', args: [{ kind: 'type', type: { name: 'UInt8' } }] }`
 */
export type DataType = {
  /** Type name, e.g. `'UInt64'`, `'Array'`, `'Enum8'`, `'DOUBLE PRECISION'`. */
  name: string;
  /** Type arguments. `undefined` means no parentheses. */
  args?: DataTypeArg[];
};

/** A single argument inside a parameterized type like `Array(UInt8)` or `Nested(x UInt8, y String)`. */
export type DataTypeArg =
  | { kind: 'type'; type: DataType }
  | { kind: 'namedField'; name: string; type: DataType }
  | { kind: 'literal'; value: string }
  | { kind: 'enumValues'; values: { name: string | null; value?: string | null }[] }
  | { kind: 'setting'; name: string; value: Expression };

/** A single codec in a CODEC(...) pipeline, e.g. `LZ4` or `Delta(4)`. */
export type CodecItem = {
  /** Codec name, e.g. `'LZ4'`, `'ZSTD'`, `'Delta'`. */
  name: string;
  /** Codec arguments. `undefined` means no parentheses. */
  args?: Expression[];
};

/** An index type, e.g. `minmax`, `set(100)`, `bloom_filter(0.01)`. */
export type IndexType = {
  /** Type name, e.g. `'minmax'`, `'set'`, `'bloom_filter'`. */
  name: string;
  /** Type arguments. `undefined` means no parentheses. */
  args?: Expression[];
};

/**
 * A column definition in a CREATE TABLE statement.
 *
 * @example `name String DEFAULT 'foo' COMMENT 'the name' CODEC(ZSTD) TTL created + INTERVAL 1 DAY`
 */
export type ColumnDef = {
  kind: 'columnDef';
  /** Column name. */
  name: string;
  /** Column data type (structured). */
  type?: DataType;
  /** Nullability modifier: `'NULL'` or `'NOT NULL'`. */
  nullable?: 'NULL' | 'NOT NULL';
  /** Default value kind: `'DEFAULT'`, `'MATERIALIZED'`, `'EPHEMERAL'`, or `'ALIAS'`. */
  defaultKind?: 'DEFAULT' | 'MATERIALIZED' | 'EPHEMERAL' | 'ALIAS';
  /** Default value expression. */
  defaultExpr?: Expression;
  /** Column comment string. */
  comment?: string;
  /** Compression codec pipeline. */
  codec?: CodecItem[];
  /** Statistics types. */
  statistics?: CodecItem[];
  /** TTL expression for the column. */
  ttl?: Expression;
  /** Collation name (e.g. `'utf8_unicode_ci'`). */
  collate?: string;
  /** `true` when the column has an inline `PRIMARY KEY` modifier. */
  primaryKey?: boolean;
  /** Column-level SETTINGS. */
  columnSettings?: SettingItem[];
} & NodeMetadata;

/**
 * A constraint definition in a CREATE TABLE column list.
 *
 * @example `CONSTRAINT c1 CHECK x > 0`
 * @example `CONSTRAINT c2 ASSUME length(name) = name_len`
 */
export type ConstraintDef = {
  kind: 'constraintDef';
  /** Constraint name. */
  name: string;
  /** Constraint type: `'CHECK'` or `'ASSUME'`. */
  constraintType: 'CHECK' | 'ASSUME';
  /** The boolean expression for the constraint. */
  expr: Expression;
} & NodeMetadata;

/**
 * An index definition in a CREATE TABLE column list.
 *
 * @example `INDEX idx_name expr TYPE minmax GRANULARITY 4`
 */
export type IndexDef = {
  kind: 'indexDef';
  /** Index name. */
  name: string;
  /** The indexed expression. */
  expr: Expression;
  /** Index type (structured). */
  indexType: IndexType;
  /** Granularity value. */
  granularity?: number;
} & NodeMetadata;

/**
 * A projection definition in a CREATE TABLE column list.
 *
 * @example `PROJECTION proj_name (SELECT col1, col2 ORDER BY col1)`
 */
export type ProjectionDef = {
  kind: 'projectionDef';
  /** Projection name. */
  name: string;
  /** The projection SELECT query (for standard projections). */
  query?: SelectStatement;
  /** PROJECTION ... INDEX col TYPE name (for projection index syntax). */
  projectionIndex?: { column: string; typeName: string };
} & NodeMetadata;

/**
 * A foreign key definition in a CREATE TABLE column list.
 * ClickHouse accepts but ignores foreign keys.
 *
 * @example `FOREIGN KEY (a) REFERENCES other (b)`
 */
export type ForeignKeyDef = {
  kind: 'foreignKeyDef';
  /** Columns in this table. */
  columns: Expression[];
  /** Referenced table. */
  refTable: TableRef;
  /** Referenced columns. */
  refColumns: Expression[];
} & NodeMetadata;

/** Any element that can appear in a CREATE TABLE column list. */
export type TableElement = ColumnDef | ConstraintDef | IndexDef | ProjectionDef | ForeignKeyDef;

/**
 * An engine clause: `ENGINE = name[(args)]`.
 *
 * @example `ENGINE = MergeTree` → `{ name: 'MergeTree' }`
 * @example `ENGINE = MergeTree()` → `{ name: 'MergeTree', args: [] }`
 * @example `ENGINE = ReplicatedMergeTree('/table', '{replica}')` → `{ name: 'ReplicatedMergeTree', args: [...] }`
 */
export type EngineClause = {
  /** Engine name (e.g. `'MergeTree'`, `'Memory'`, `'ReplicatedMergeTree'`). */
  name: string;
  /** Engine arguments. `undefined` means no parentheses; `[]` means empty parens `()`. */
  args?: Expression[];
};

/** Common fields for DDL CREATE statements. */
type CreateCommonFields = {
  orReplace?: boolean;
  ifNotExists?: boolean;
  onCluster?: string;
} & NodeMetadata;

export type TableOrderByItem = { expr: Expression; dir?: 'ASC' | 'DESC' };

/** A single TTL item with an expression and optional WHERE clause. */
export type TTLItem = { expr: Expression; where?: Expression };

/** Storage-related clauses shared by CREATE TABLE and CREATE MATERIALIZED VIEW. */
type StorageClauses = {
  engine?: EngineClause;
  orderBy?: TableOrderByItem[];
  partitionBy?: Expression;
  primaryKey?: Expression[];
  sampleBy?: Expression;
  ttl?: TTLItem[];
  settings?: SettingItem[];
  comment?: string;
};

/**
 * `CREATE TABLE`, `CREATE OR REPLACE TABLE`, or `REPLACE TABLE`.
 * @example `CREATE TABLE t (id UInt64) ENGINE = MergeTree ORDER BY id`
 */
export type CreateTableStatement = {
  kind: 'createTable';
  replace?: boolean;
  temporary?: boolean;
  table: TableRef;
  tableElements?: TableElement[];
  primaryKeyInSchema?: Expression[];
  asTable?: TableRef;
  clone?: boolean;
  asQuery?: QueryStatement;
  asTableFunction?: { name: string; args: Expression[] };
  empty?: boolean;
} & StorageClauses &
  CreateCommonFields;

/** `CREATE VIEW` or `CREATE OR REPLACE VIEW`. */
export type CreateViewStatement = {
  kind: 'createView';
  temporary?: boolean;
  table: TableRef;
  tableElements?: TableElement[];
  asQuery: QueryStatement;
} & CreateCommonFields;

/** `CREATE MATERIALIZED VIEW`. */
export type CreateMaterializedViewStatement = {
  kind: 'createMaterializedView';
  table: TableRef;
  tableElements?: TableElement[];
  toTable?: TableRef;
  populate?: boolean;
  empty?: boolean;
  asQuery: QueryStatement;
} & StorageClauses &
  CreateCommonFields;

/** `CREATE DATABASE`. */
export type CreateDatabaseStatement = {
  kind: 'createDatabase';
  name: string;
  engine?: EngineClause;
  orderBy?: TableOrderByItem[];
  comment?: string;
  settings?: SettingItem[];
} & CreateCommonFields;

/** `CREATE FUNCTION`. */
export type CreateFunctionStatement = {
  kind: 'createFunction';
  name: string;
  functionExpr: Expression;
} & CreateCommonFields;

/** `CREATE INDEX` (standalone, not inside CREATE TABLE). */
export type CreateIndexStatement = {
  kind: 'createIndex';
  indexName: string;
  table: TableRef;
  indexExpr: Expression;
  indexType?: IndexType;
  granularity?: number;
} & CreateCommonFields;

/** `CREATE DICTIONARY`. */
export type CreateDictionaryStatement = {
  kind: 'createDictionary';
  table: TableRef;
  dictAttrs: {
    name: string;
    type: DataType;
    defaultValue?: Expression;
    expression?: Expression;
  }[];
  dictDef: {
    primaryKey?: Expression[];
    source?: { name: string; pairs: { name: string; value: Expression }[] };
    lifetime?: { min?: number; max?: number; value?: number };
    layout?: { name: string; pairs: { name: string; value: Expression }[] };
    range?: { name: string; value: Expression }[];
    settings?: SettingItem[];
    comment?: string;
  };
} & CreateCommonFields;

/** `CREATE WORKLOAD`. */
export type CreateWorkloadStatement = {
  kind: 'createWorkload';
  name: string;
  parentWorkload?: string;
} & CreateCommonFields;

/** Authentication data for a CREATE USER statement. */
export type AuthenticationData = {
  /** Secret value (password, hash, realm, server name). */
  secret?: string;
  /** Number of SSH keys (for ssh_key type). */
  sshKeys?: number;
};

/** `CREATE USER`. */
export type CreateUserStatement = {
  kind: 'createUser';
  /** User name(s) with optional @'host' suffix. */
  names: AccessControlName[];
  /** Parsed authentication methods. */
  auth?: AuthenticationData[];
  /** HOST specification items. */
  host?: HostItem[];
  /** Access control settings. */
  settings?: AccessControlSettingsItem[] | 'NONE';
  /** Default role clause. */
  defaultRole?: DefaultRoleClause;
  /** DEFAULT DATABASE clause. */
  defaultDatabase?: string;
  /** GRANTEES clause. */
  grantees?: RoleTarget;
  /** VALID UNTIL value. */
  validUntil?: string;
} & CreateCommonFields;

/** `CREATE ROLE`. */
export type CreateRoleStatement = {
  kind: 'createRole';
  /** Role name(s) with optional @'host' suffix. */
  names: AccessControlName[];
  /** Access control settings. */
  settings?: AccessControlSettingsItem[] | 'NONE';
} & CreateCommonFields;

/** `CREATE ROW POLICY` (or `CREATE POLICY`). */
export type CreateRowPolicyStatement = {
  kind: 'createRowPolicy';
  /** Whether the ROW keyword was used (vs plain POLICY). */
  hasRowKeyword?: boolean;
  /** Policy name(s) and their target table(s). */
  targets: { names: string[]; table: TableRef }[];
  /** USING expression. */
  using?: Expression;
  /** AS RESTRICTIVE or AS PERMISSIVE. */
  restrictive?: 'RESTRICTIVE' | 'PERMISSIVE';
  /** TO clause. */
  to?: RoleTarget;
} & CreateCommonFields;

/** `CREATE QUOTA`. */
export type CreateQuotaStatement = {
  kind: 'createQuota';
  /** Quota name(s). */
  names: string[];
  /** KEY/KEYED BY clause. */
  keyed?: { notKeyed: true } | { keys: string[] };
  /** Interval definitions. */
  intervals?: {
    randomized?: boolean;
    duration: string;
    unit: string;
    trackingOnly?: boolean;
    noLimits?: boolean;
    limits?: { name: string; value: Expression }[];
  }[];
  /** TO clause. */
  to?: RoleTarget;
} & CreateCommonFields;

/** `CREATE SETTINGS PROFILE` (or `CREATE PROFILE`). */
export type CreateSettingsProfileStatement = {
  kind: 'createSettingsProfile';
  /** Whether the SETTINGS keyword was used before PROFILE. */
  hasSettingsKeyword?: boolean;
  /** Profile name(s). */
  names: string[];
  /** Access control settings. */
  settings?: AccessControlSettingsItem[] | 'NONE';
  /** TO clause. */
  to?: RoleTarget;
} & CreateCommonFields;

/** `CREATE NAMED COLLECTION`. */
export type CreateNamedCollectionStatement = {
  kind: 'createNamedCollection';
  /** Collection name. */
  name: string;
  /** Key-value items. */
  items: { key: string; value: Expression }[];
} & CreateCommonFields;

/** `CREATE RESOURCE`. */
export type CreateResourceStatement = {
  kind: 'createResource';
  /** Resource name. */
  name: string;
  /** Resource specifications: (operation disk name). */
  specs: { operation: string; resourceType: string; resourceName: string }[];
} & CreateCommonFields;

/** `CREATE WINDOW VIEW`. Raw body stored since syntax is extremely complex. */
export type CreateWindowViewStatement = {
  kind: 'createWindowView';
  /** Raw body text after CREATE [OR REPLACE] WINDOW VIEW. */
  rawBody: string;
} & NodeMetadata;

/** `CREATE LIVE VIEW`. Raw body stored since syntax is rarely used. */
export type CreateLiveViewStatement = {
  kind: 'createLiveView';
  /** Raw body text after CREATE [OR REPLACE] LIVE VIEW. */
  rawBody: string;
} & NodeMetadata;

/** Union of all CREATE statement types. */
export type CreateStatement =
  | CreateTableStatement
  | CreateViewStatement
  | CreateMaterializedViewStatement
  | CreateDatabaseStatement
  | CreateFunctionStatement
  | CreateIndexStatement
  | CreateDictionaryStatement
  | CreateWorkloadStatement
  | CreateUserStatement
  | CreateRoleStatement
  | CreateRowPolicyStatement
  | CreateQuotaStatement
  | CreateSettingsProfileStatement
  | CreateNamedCollectionStatement
  | CreateResourceStatement
  | CreateWindowViewStatement
  | CreateLiveViewStatement;

/**
 * A PARALLEL WITH statement: chains multiple CREATE statements for parallel execution.
 *
 * @example `CREATE TABLE t1 (...) ENGINE=X PARALLEL WITH CREATE TABLE t2 (...) ENGINE=Y`
 */
export type ParallelWithStatement = {
  kind: 'parallelWith';
  /** The CREATE or INSERT statements being executed in parallel (always 2+). */
  queries: (CreateStatement | InsertStatement | TruncateStatement | DropStatement)[];
} & NodeMetadata;

/**
 * An INSERT statement: inserts data into a table or table function.
 *
 * @example `INSERT INTO t (a, b) VALUES (1, 2)` — VALUES data is not stored in AST
 * @example `INSERT INTO t SELECT * FROM other` — SELECT query is stored in `selectQuery`
 * @example `INSERT INTO TABLE FUNCTION s3(...) PARTITION BY val SELECT ...`
 */
export type InsertStatement = {
  kind: 'insert';
  /** The insert target — either a table reference or a table function. */
  target: { kind: 'table'; table: TableRef } | { kind: 'function'; func: TableFunctionRef };
  /** Optional column list for the insert. */
  columns?: Expression[];
  /** Optional PARTITION BY expression. */
  partitionBy?: Expression;
  /** Optional INSERT-level SETTINGS (before SELECT/VALUES). */
  insertSettings?: SettingItem[];
  /** Optional SELECT query (for INSERT ... SELECT). */
  selectQuery?: QueryStatement;
  /** Optional SELECT-level SETTINGS (after SELECT). */
  querySettings?: SettingItem[];
} & NodeMetadata;

/**
 * A TRUNCATE statement: removes all data from a table.
 *
 * @example `TRUNCATE TABLE t`
 */
export type TruncateStatement = {
  kind: 'truncate';
  /** The table to truncate. */
  table: TableRef;
} & NodeMetadata;

/**
 * A DROP statement: drops a table, view, database, dictionary, or function.
 *
 * @example `DROP TABLE IF EXISTS t`
 * @example `DROP DATABASE mydb`
 */
export type DropStatement = {
  kind: 'drop';
  /** The target to drop (single table/database/etc.). */
  table?: TableRef;
  /** Multiple targets for comma-separated DROP (e.g. DROP TABLE t1, t2). */
  tables?: TableRef[];
  /** The type of object being dropped. */
  targetType: 'TABLE' | 'VIEW' | 'DICTIONARY' | 'DATABASE' | 'FUNCTION' | 'INDEX';
  /** For DROP INDEX: the index name. */
  indexName?: string;
  /** Whether TEMPORARY keyword was specified. */
  temporary?: boolean;
  /** Whether IF EXISTS or IF EMPTY was specified. */
  ifExists?: boolean;
  /** Optional ON CLUSTER clause. */
  onCluster?: string;
  /** Optional SETTINGS clause. */
  settings?: SettingItem[];
  /** Optional FORMAT clause. */
  format?: string;
} & NodeMetadata;

/**
 * Union of all top-level statement types.
 *
 * Use the `kind` field to discriminate between variants.
 */
export type Statement =
  | QueryStatement
  | ExplainStatement
  | SetStatement
  | TransactionControlStatement
  | SetRoleStatement
  | UseStatement
  | SystemStatement
  | CreateStatement
  | ParallelWithStatement
  | InsertStatement
  | TruncateStatement
  | DropStatement;

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
  arrayLiteral: ArrayLiteral;
  tupleLiteral: TupleLiteral;
  columnsExpr: ColumnsExpr;
  jsonSubcolumn: JsonSubcolumn;
  orderByItem: OrderByItem;
  cteSubquery: CTESubquery;
  cteExpr: CTEExpr;
  subqueryFrom: SubqueryFrom;
  tableFunctionRef: TableFunctionRef;
  joinExpr: JoinExpr;
  arrayJoinExpr: ArrayJoinExpr;
  select: SelectStatement;
  union: UnionStatement;
  intersect: IntersectStatement;
  explain: ExplainStatement;
  set: SetStatement;
  transactionControl: TransactionControlStatement;
  setRole: SetRoleStatement;
  use: UseStatement;
  system: SystemStatement;
  createTable: CreateTableStatement;
  createView: CreateViewStatement;
  createMaterializedView: CreateMaterializedViewStatement;
  createDatabase: CreateDatabaseStatement;
  createFunction: CreateFunctionStatement;
  createIndex: CreateIndexStatement;
  createDictionary: CreateDictionaryStatement;
  createWorkload: CreateWorkloadStatement;
  createUser: CreateUserStatement;
  createRole: CreateRoleStatement;
  createRowPolicy: CreateRowPolicyStatement;
  createQuota: CreateQuotaStatement;
  createSettingsProfile: CreateSettingsProfileStatement;
  createNamedCollection: CreateNamedCollectionStatement;
  createResource: CreateResourceStatement;
  createWindowView: CreateWindowViewStatement;
  createLiveView: CreateLiveViewStatement;
  parallelWith: ParallelWithStatement;
  insert: InsertStatement;
  truncate: TruncateStatement;
  drop: DropStatement;
  columnDef: ColumnDef;
  constraintDef: ConstraintDef;
  indexDef: IndexDef;
  projectionDef: ProjectionDef;
  foreignKeyDef: ForeignKeyDef;
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
    windows: z.array(z.object({ name: z.string(), spec: WindowSpecSchema })).optional(),
    qualify: ExpressionSchema.optional(),
    parenthesized: z.boolean().optional(),
    settings: z.array(SettingItemSchema).optional(),
    ...TrailingClausesFields,
    ...ExprMetadataFields,
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
    ...ExprMetadataFields,
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
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link CTE}. */
export const CTESchema: z.ZodType<CTE> = z.lazy(() =>
  z.union([
    z.object({
      kind: z.literal('cteSubquery'),
      name: z.string(),
      query: QueryStatementSchema,
      ...ExprMetadataFields,
    }),
    z.object({
      kind: z.literal('cteExpr'),
      name: z.string(),
      expr: ExpressionSchema,
      ...ExprMetadataFields,
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
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link TableFunctionRef}. */
export const TableFunctionRefSchema: z.ZodType<TableFunctionRef> = z.lazy(() =>
  z.object({
    kind: z.literal('tableFunctionRef'),
    name: z.string(),
    args: z.array(ExpressionSchema),
    final: z.boolean().optional(),
    alias: z.string().optional(),
    sample: SampleClauseSchema.optional(),
    settings: z.array(SettingItemSchema).optional(),
    ...ExprMetadataFields,
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
    kind: z.literal('joinExpr'),
    joinType: JoinTypeSchema,
    left: FromExprSchema,
    right: z.union([TableRefSchema, SubqueryFromSchema, TableFunctionRefSchema]),
    constraint: JoinConstraintSchema.optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link ArrayJoinExpr}. */
export const ArrayJoinExprSchema: z.ZodType<ArrayJoinExpr> = z.lazy(() =>
  z.object({
    kind: z.literal('arrayJoinExpr'),
    joinType: ArrayJoinTypeSchema,
    left: FromExprSchema,
    expressions: z.array(ExpressionSchema),
    ...ExprMetadataFields,
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
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link SetStatement}. */
export const SetStatementSchema: z.ZodType<SetStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('set'),
    settings: z.array(SettingItemSchema).optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link RoleTarget}. */
export const RoleTargetSchema: z.ZodType<RoleTarget> = z.union([
  z.object({ kind: z.literal('all'), except: z.array(z.string()).optional() }),
  z.object({ kind: z.literal('none') }),
  z.object({ kind: z.literal('names'), names: z.array(z.string()) }),
]);

/** Zod schema for {@link TransactionControlStatement}. */
export const TransactionControlStatementSchema: z.ZodType<TransactionControlStatement> = z.lazy(
  () =>
    z.object({
      kind: z.literal('transactionControl'),
      snapshot: z.string(),
      ...ExprMetadataFields,
    }),
);

/** Zod schema for {@link SetRoleStatement}. */
export const SetRoleStatementSchema: z.ZodType<SetRoleStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('setRole'),
    roles: RoleTargetSchema,
    users: z.array(z.string()),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link AccessControlName}. */
const AccessControlNameSchema: z.ZodType<AccessControlName> = z.object({
  name: z.string(),
  host: z.string().optional(),
});

/** Zod schema for {@link HostItem}. */
const HostItemSchema: z.ZodType<HostItem> = z.union([
  z.object({ kind: z.literal('any') }),
  z.object({ kind: z.literal('none') }),
  z.object({ kind: z.literal('local') }),
  z.object({ kind: z.literal('name'), value: z.string() }),
  z.object({ kind: z.literal('regexp'), value: z.string() }),
  z.object({ kind: z.literal('like'), value: z.string() }),
  z.object({ kind: z.literal('ip'), value: z.string() }),
]);

/** Zod schema for {@link AccessControlSettingsItem}. */
const AccessControlSettingsItemSchema: z.ZodType<AccessControlSettingsItem> = z.lazy(() =>
  z.union([
    z.object({ kind: z.literal('profile'), name: z.string() }),
    z.object({ kind: z.literal('inherit'), name: z.string() }),
    z.object({
      kind: z.literal('setting'),
      name: z.string(),
      value: ExpressionSchema.optional(),
      min: ExpressionSchema.optional(),
      max: ExpressionSchema.optional(),
      modifier: z
        .union([z.literal('CONST'), z.literal('WRITABLE'), z.literal('READONLY')])
        .optional(),
    }),
  ]),
);

/** Zod schema for {@link UseStatement}. */
export const UseStatementSchema: z.ZodType<UseStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('use'),
    database: z.string(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link SystemStatement}. */
export const SystemStatementSchema: z.ZodType<SystemStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('system'),
    body: z.string(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link ColumnDef}. */
const DataTypeArgSchema: z.ZodType<DataTypeArg> = z.lazy(() =>
  z.union([
    z.object({ kind: z.literal('type'), type: DataTypeSchema }),
    z.object({ kind: z.literal('namedField'), name: z.string(), type: DataTypeSchema }),
    z.object({ kind: z.literal('literal'), value: z.string() }),
    z.object({
      kind: z.literal('enumValues'),
      values: z.array(
        z.object({
          name: z.union([z.string(), z.null()]),
          value: z.union([z.string(), z.null()]).optional(),
        }),
      ),
    }),
    z.object({ kind: z.literal('setting'), name: z.string(), value: ExpressionSchema }),
  ]),
);

const DataTypeSchema: z.ZodType<DataType> = z.lazy(() =>
  z.object({ name: z.string(), args: z.array(DataTypeArgSchema).optional() }),
);

const CodecItemSchema = z.object({
  name: z.string(),
  args: z.array(ExpressionSchema).optional(),
});

const IndexTypeSchema = z.object({
  name: z.string(),
  args: z.array(ExpressionSchema).optional(),
});

export const ColumnDefSchema: z.ZodType<ColumnDef> = z.lazy(() =>
  z.object({
    kind: z.literal('columnDef'),
    name: z.string(),
    type: DataTypeSchema.optional(),
    nullable: z.union([z.literal('NULL'), z.literal('NOT NULL')]).optional(),
    defaultKind: z
      .union([
        z.literal('DEFAULT'),
        z.literal('MATERIALIZED'),
        z.literal('EPHEMERAL'),
        z.literal('ALIAS'),
      ])
      .optional(),
    defaultExpr: ExpressionSchema.optional(),
    comment: z.string().optional(),
    codec: z.array(CodecItemSchema).optional(),
    statistics: z.array(CodecItemSchema).optional(),
    ttl: ExpressionSchema.optional(),
    collate: z.string().optional(),
    primaryKey: z.boolean().optional(),
    columnSettings: z.array(SettingItemSchema).optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link ConstraintDef}. */
export const ConstraintDefSchema: z.ZodType<ConstraintDef> = z.lazy(() =>
  z.object({
    kind: z.literal('constraintDef'),
    name: z.string(),
    constraintType: z.union([z.literal('CHECK'), z.literal('ASSUME')]),
    expr: ExpressionSchema,
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link IndexDef}. */
export const IndexDefSchema: z.ZodType<IndexDef> = z.lazy(() =>
  z.object({
    kind: z.literal('indexDef'),
    name: z.string(),
    expr: ExpressionSchema,
    indexType: IndexTypeSchema,
    granularity: z.number().optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link ProjectionDef}. */
export const ProjectionDefSchema: z.ZodType<ProjectionDef> = z.lazy(() =>
  z.object({
    kind: z.literal('projectionDef'),
    name: z.string(),
    query: SelectStatementSchema.optional(),
    projectionIndex: z.object({ column: z.string(), typeName: z.string() }).optional(),
    ...ExprMetadataFields,
  }),
);

export const ForeignKeyDefSchema: z.ZodType<ForeignKeyDef> = z.lazy(() =>
  z.object({
    kind: z.literal('foreignKeyDef'),
    columns: z.array(ExpressionSchema),
    refTable: TableRefSchema,
    refColumns: z.array(ExpressionSchema),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link TableElement}. */
export const TableElementSchema: z.ZodType<TableElement> = z.lazy(() =>
  z.union([
    ColumnDefSchema,
    ConstraintDefSchema,
    IndexDefSchema,
    ProjectionDefSchema,
    ForeignKeyDefSchema,
  ]),
);

/** Zod schema for {@link EngineClause}. */
export const EngineClauseSchema = z.object({
  name: z.string(),
  args: z.array(ExpressionSchema).optional(),
});

export const TableOrderByItemSchema: z.ZodType<TableOrderByItem> = z.object({
  expr: ExpressionSchema,
  dir: z.union([z.literal('ASC'), z.literal('DESC')]).optional(),
});

const StorageClausesFields = {
  engine: EngineClauseSchema.optional(),
  orderBy: z.array(TableOrderByItemSchema).optional(),
  partitionBy: ExpressionSchema.optional(),
  primaryKey: z.array(ExpressionSchema).optional(),
  sampleBy: ExpressionSchema.optional(),
  ttl: z.array(z.object({ expr: ExpressionSchema, where: ExpressionSchema.optional() })).optional(),
  settings: z.array(SettingItemSchema).optional(),
  comment: z.string().optional(),
};

const CreateCommonFields = {
  orReplace: z.boolean().optional(),
  ifNotExists: z.boolean().optional(),
  onCluster: z.string().optional(),
  ...ExprMetadataFields,
};

export const CreateTableStatementSchema: z.ZodType<CreateTableStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createTable'),
    replace: z.boolean().optional(),
    temporary: z.boolean().optional(),
    table: TableRefSchema,
    tableElements: z.array(TableElementSchema).optional(),
    primaryKeyInSchema: z.array(ExpressionSchema).optional(),
    asTable: TableRefSchema.optional(),
    clone: z.boolean().optional(),
    asQuery: QueryStatementSchema.optional(),
    asTableFunction: z.object({ name: z.string(), args: z.array(ExpressionSchema) }).optional(),
    empty: z.boolean().optional(),
    ...StorageClausesFields,
    ...CreateCommonFields,
  }),
);

export const CreateViewStatementSchema: z.ZodType<CreateViewStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createView'),
    temporary: z.boolean().optional(),
    table: TableRefSchema,
    tableElements: z.array(TableElementSchema).optional(),
    asQuery: QueryStatementSchema,
    ...CreateCommonFields,
  }),
);

export const CreateMaterializedViewStatementSchema: z.ZodType<CreateMaterializedViewStatement> =
  z.lazy(() =>
    z.object({
      kind: z.literal('createMaterializedView'),
      table: TableRefSchema,
      tableElements: z.array(TableElementSchema).optional(),
      toTable: TableRefSchema.optional(),
      populate: z.boolean().optional(),
      empty: z.boolean().optional(),
      asQuery: QueryStatementSchema,
      ...StorageClausesFields,
      ...CreateCommonFields,
    }),
  );

export const CreateDatabaseStatementSchema: z.ZodType<CreateDatabaseStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createDatabase'),
    name: z.string(),
    engine: EngineClauseSchema.optional(),
    orderBy: z.array(TableOrderByItemSchema).optional(),
    comment: z.string().optional(),
    settings: z.array(SettingItemSchema).optional(),
    ...CreateCommonFields,
  }),
);

export const CreateFunctionStatementSchema: z.ZodType<CreateFunctionStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createFunction'),
    name: z.string(),
    functionExpr: ExpressionSchema,
    ...CreateCommonFields,
  }),
);

export const CreateIndexStatementSchema: z.ZodType<CreateIndexStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createIndex'),
    indexName: z.string(),
    table: TableRefSchema,
    indexExpr: ExpressionSchema,
    indexType: IndexTypeSchema.optional(),
    granularity: z.number().optional(),
    ...CreateCommonFields,
  }),
);

export const CreateDictionaryStatementSchema: z.ZodType<CreateDictionaryStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createDictionary'),
    table: TableRefSchema,
    dictAttrs: z.array(
      z.object({
        name: z.string(),
        type: DataTypeSchema,
        defaultValue: ExpressionSchema.optional(),
        expression: ExpressionSchema.optional(),
      }),
    ),
    dictDef: z.any(),
    ...CreateCommonFields,
  }),
);

export const CreateWorkloadStatementSchema: z.ZodType<CreateWorkloadStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createWorkload'),
    name: z.string(),
    parentWorkload: z.string().optional(),
    ...CreateCommonFields,
  }),
);

const AccessControlSettingsField = z
  .union([z.array(AccessControlSettingsItemSchema), z.literal('NONE' as const)])
  .optional();

export const CreateUserStatementSchema: z.ZodType<CreateUserStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createUser'),
    names: z.array(AccessControlNameSchema),
    auth: z
      .array(
        z.object({
          secret: z.string().optional(),
          sshKeys: z.number().optional(),
        }),
      )
      .optional(),
    host: z.array(HostItemSchema).optional(),
    settings: AccessControlSettingsField,
    defaultRole: RoleTargetSchema.optional(),
    defaultDatabase: z.string().optional(),
    grantees: RoleTargetSchema.optional(),
    validUntil: z.string().optional(),
    ...CreateCommonFields,
  }),
);
export const CreateRoleStatementSchema: z.ZodType<CreateRoleStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createRole'),
    names: z.array(AccessControlNameSchema),
    settings: AccessControlSettingsField,
    ...CreateCommonFields,
  }),
);
export const CreateRowPolicyStatementSchema: z.ZodType<CreateRowPolicyStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createRowPolicy'),
    hasRowKeyword: z.boolean().optional(),
    targets: z.array(
      z.object({
        names: z.array(z.string()),
        table: TableRefSchema,
      }),
    ),
    using: ExpressionSchema.optional(),
    restrictive: z.union([z.literal('RESTRICTIVE'), z.literal('PERMISSIVE')]).optional(),
    to: RoleTargetSchema.optional(),
    ...CreateCommonFields,
  }),
);
export const CreateQuotaStatementSchema: z.ZodType<CreateQuotaStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createQuota'),
    names: z.array(z.string()),
    keyed: z
      .union([z.object({ notKeyed: z.literal(true) }), z.object({ keys: z.array(z.string()) })])
      .optional(),
    intervals: z
      .array(
        z.object({
          randomized: z.boolean().optional(),
          duration: z.string(),
          unit: z.string(),
          trackingOnly: z.boolean().optional(),
          noLimits: z.boolean().optional(),
          limits: z.array(z.object({ name: z.string(), value: ExpressionSchema })).optional(),
        }),
      )
      .optional(),
    to: RoleTargetSchema.optional(),
    ...CreateCommonFields,
  }),
);
export const CreateSettingsProfileStatementSchema: z.ZodType<CreateSettingsProfileStatement> =
  z.object({
    kind: z.literal('createSettingsProfile'),
    hasSettingsKeyword: z.boolean().optional(),
    names: z.array(z.string()),
    settings: AccessControlSettingsField,
    to: RoleTargetSchema.optional(),
    ...CreateCommonFields,
  });
export const CreateNamedCollectionStatementSchema: z.ZodType<CreateNamedCollectionStatement> =
  z.lazy(() =>
    z.object({
      kind: z.literal('createNamedCollection'),
      name: z.string(),
      items: z.array(z.object({ key: z.string(), value: ExpressionSchema })),
      ...CreateCommonFields,
    }),
  );
export const CreateResourceStatementSchema: z.ZodType<CreateResourceStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createResource'),
    name: z.string(),
    specs: z.array(
      z.object({
        operation: z.string(),
        resourceType: z.string(),
        resourceName: z.string(),
      }),
    ),
    ...CreateCommonFields,
  }),
);
const rawBodyFields = { rawBody: z.string(), ...ExprMetadataFields };
export const CreateWindowViewStatementSchema: z.ZodType<CreateWindowViewStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createWindowView'),
    ...rawBodyFields,
  }),
);
export const CreateLiveViewStatementSchema: z.ZodType<CreateLiveViewStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('createLiveView'),
    ...rawBodyFields,
  }),
);

const CreateStatementSchema: z.ZodType<CreateStatement> = z.lazy(() =>
  z.union([
    CreateTableStatementSchema,
    CreateViewStatementSchema,
    CreateMaterializedViewStatementSchema,
    CreateDatabaseStatementSchema,
    CreateFunctionStatementSchema,
    CreateIndexStatementSchema,
    CreateDictionaryStatementSchema,
    CreateWorkloadStatementSchema,
    CreateUserStatementSchema,
    CreateRoleStatementSchema,
    CreateRowPolicyStatementSchema,
    CreateQuotaStatementSchema,
    CreateSettingsProfileStatementSchema,
    CreateNamedCollectionStatementSchema,
    CreateResourceStatementSchema,
    CreateWindowViewStatementSchema,
    CreateLiveViewStatementSchema,
  ]),
);

/** Zod schema for {@link QueryStatement}. */
export const QueryStatementSchema: z.ZodType<QueryStatement> = z.lazy(() =>
  z.union([
    SelectStatementSchema,
    UnionStatementSchema,
    IntersectStatementSchema,
    ExplainStatementSchema,
  ]),
);

/** Zod schema for {@link ParallelWithStatement}. */
export const ParallelWithStatementSchema: z.ZodType<ParallelWithStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('parallelWith'),
    queries: z.array(
      z.union([
        CreateStatementSchema,
        InsertStatementSchema,
        TruncateStatementSchema,
        DropStatementSchema,
      ]),
    ),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link InsertStatement}. */
export const InsertStatementSchema: z.ZodType<InsertStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('insert'),
    target: z.union([
      z.object({ kind: z.literal('table'), table: TableRefSchema }),
      z.object({ kind: z.literal('function'), func: TableFunctionRefSchema }),
    ]),
    columns: z.array(ExpressionSchema).optional(),
    partitionBy: ExpressionSchema.optional(),
    insertSettings: z.array(SettingItemSchema).optional(),
    selectQuery: QueryStatementSchema.optional(),
    querySettings: z.array(SettingItemSchema).optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link TruncateStatement}. */
export const TruncateStatementSchema: z.ZodType<TruncateStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('truncate'),
    table: TableRefSchema,
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link DropStatement}. */
export const DropStatementSchema: z.ZodType<DropStatement> = z.lazy(() =>
  z.object({
    kind: z.literal('drop'),
    table: TableRefSchema.optional(),
    tables: z.array(TableRefSchema).optional(),
    targetType: z.enum(['TABLE', 'VIEW', 'DICTIONARY', 'DATABASE', 'FUNCTION', 'INDEX']),
    temporary: z.boolean().optional(),
    ifExists: z.boolean().optional(),
    onCluster: z.string().optional(),
    settings: z.array(SettingItemSchema).optional(),
    format: z.string().optional(),
    ...ExprMetadataFields,
  }),
);

/** Zod schema for {@link Statement}. */
export const StatementSchema: z.ZodType<Statement> = z.lazy(() =>
  z.union([
    SelectStatementSchema,
    UnionStatementSchema,
    IntersectStatementSchema,
    ExplainStatementSchema,
    SetStatementSchema,
    TransactionControlStatementSchema,
    SetRoleStatementSchema,
    UseStatementSchema,
    SystemStatementSchema,
    CreateStatementSchema,
    ParallelWithStatementSchema,
    InsertStatementSchema,
    TruncateStatementSchema,
    DropStatementSchema,
  ]),
);

/** Zod schema for an array of {@link Statement}s (the top-level parse result). */
export const StatementsSchema = z.array(StatementSchema);
