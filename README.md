# clickhouse-node-parser

A TypeScript parser for ClickHouse SQL. Parses ClickHouse SQL into a typed AST, with support for formatting back to SQL.

**Note:** This is alpha-level Claudeware. The API and AST formats are subject to change.

## Installation

```bash
npm install clickhouse-node-parser
```

## Usage

### Parsing SQL to AST

```typescript
import { parse } from 'clickhouse-node-parser';

const ast = parse('SELECT id, name FROM users WHERE active = 1 ORDER BY name');
```

`parse()` accepts a string containing one or more ClickHouse SQL statements (semicolon-separated) and returns a `Statement[]` array.

The AST for the query above:

```json
[
  {
    "kind": "select",
    "select": [
      { "kind": "columnRef", "parts": ["id"] },
      { "kind": "columnRef", "parts": ["name"] }
    ],
    "from": {
      "kind": "tableRef",
      "table": "users"
    },
    "where": {
      "kind": "binaryExpr",
      "op": "=",
      "left": { "kind": "columnRef", "parts": ["active"] },
      "right": { "kind": "literal", "type": "UInt64", "value": "1" }
    },
    "orderBy": [
      {
        "kind": "orderByItem",
        "expr": { "kind": "columnRef", "parts": ["name"] },
        "direction": "ASC"
      }
    ]
  }
]
```

Each node has a `kind` discriminator field. See [ast.ts](src/ast.ts) for all node types and their Zod schemas.

### Formatting AST back to SQL

```typescript
import { parse, format } from 'clickhouse-node-parser';

const ast = parse('SELECT id, name FROM users WHERE active = 1 ORDER BY name');
const sql = format(ast);
```

The formatted output for the above:

```sql
SELECT
    id,
    name
FROM users
WHERE active = 1
ORDER BY name ASC;
```

`format()` converts the AST back into normalized, readable SQL. Parsing and formatting is round-trip safe — parsing the formatted output produces an identical AST.

### EXPLAIN output

```typescript
import { parse, formatExplain } from 'clickhouse-node-parser';

const ast = parse('SELECT a + b FROM t WHERE x = 1');
const explain = formatExplain(ast);
```

`formatExplain()` produces a tree representation matching ClickHouse's `EXPLAIN AST` output:

```
SelectWithUnionQuery (children 1)
 ExpressionList (children 1)
  SelectQuery (children 3)
   ExpressionList (children 1)
    Function plus (children 1)
     ExpressionList (children 2)
      Identifier a
      Identifier b
   TablesInSelectQuery (children 1)
    TablesInSelectQueryElement (children 1)
     TableExpression (children 1)
      TableIdentifier t
   Function equals (children 1)
    ExpressionList (children 2)
     Identifier x
     Literal UInt64_1
```

### Error handling

When parsing fails, `parse()` throws a `ParseError` with structured information about where and why the parse failed.

```typescript
import { parse, ParseError } from 'clickhouse-node-parser';

try {
  parse('SELECT ???');
} catch (e) {
  if (e instanceof ParseError) {
    e.message;  // Human-readable error message
    e.location; // { start: { line, column, offset }, end: { line, column, offset } }
    e.expected; // What the parser expected (e.g. literals, token classes)
    e.found;    // What was found instead (string | null)
  }
}
```

## Supported SQL

### Statements

- **SELECT** — full support, including ClickHouse-specific clauses and syntax
- **UNION ALL / UNION DISTINCT** — with correct precedence
- **INTERSECT / EXCEPT** — with higher precedence than UNION
- **EXPLAIN** — with type, settings, and inner query
- **SET** — session variable assignment
- **USE** — database selection
- **SYSTEM** — system commands (parsed as raw text)
- **CREATE** - Partial DDL support (for all CREATE statements)

### Limitations

- **ClickHouse-only** — this is not a general SQL parser. Syntax from other dialects that ClickHouse doesn't support will not parse.
- **KQL** — Kusto Query Language syntax is not supported.

## Development

```bash
npm run build           # Regenerate parser from grammar + build dist/
npm test                # Run test suite
```

### Inspecting output

`parse`, `format`, and `explain` print this library's output. Each takes a raw SQL
string via `--sql`, or one or more reference cases from `tests/clickhouse-reference/`
(a `.sql` filename — the suffix is optional — a comma-separated list, or a glob):

```bash
npm run parse   -- --sql "SELECT 1"   # AST as JSON
npm run format  -- --sql "SELECT 1"   # re-formatted SQL
npm run explain -- --sql "SELECT 1"   # EXPLAIN AST output

npm run format  -- 00001_select_1     # output for a reference case
npm run explain -- '00001_*'          # output for every matching case
```

### Diffing against expected output

`diff:ast`, `diff:format`, and `diff:explain` show this library's output, the expected
output committed in `tests/clickhouse-reference/`, and a diff between them — useful for
debugging reference test failures. They take the same reference selector (filename,
comma-separated list, or glob):

```bash
npm run diff:format  -- 00001_select_1            # actual, expected, and diff
npm run diff:ast     -- '0001*' --diff-only       # just the diff
npm run diff:explain -- 00001_select_1,00002_count_visits --only-diffs
```

Flags: `--diff-only`, `--actual-only`, `--expected-only`, `--only-diffs`, `--no-color`.
Pass `-h` to any script for full usage.

The parser is built with [Peggy](https://peggyjs.org/) (PEG grammar) and produces ASTs validated by [Zod](https://zod.dev/) schemas. All AST types are exported for use in downstream tooling.
