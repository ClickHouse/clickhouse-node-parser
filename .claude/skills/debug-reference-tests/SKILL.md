---
name: debug-reference-tests
description: Debug ClickHouse reference test failures (the tests/clickhouse-reference-{ast,format,explain,round-trip} suites). Use when one or more of those reference cases fail and you need to see what this library produced vs. the committed expected output. Maps a failing case to the right diff:* npm script and walks through isolating, diffing, and fixing the cause in the grammar/formatter/explain code.
---

# Debugging ClickHouse reference test failures

The reference suites in `tests/` parse every `.sql` file in
`tests/clickhouse-reference/` and compare this library's output against the
committed expected files. Each suite checks one dimension:

| Test suite                                  | Compares against              | Expected file suffix        | Diff command    |
| ------------------------------------------- | ----------------------------- | --------------------------- | --------------- |
| `clickhouse-reference-ast.test.ts`          | `parse()` (meta stripped)     | `.expected.ast.json`        | `diff:ast`      |
| `clickhouse-reference-format.test.ts`       | `format(parse(...))`          | `.expected.formatted.sql`   | `diff:format`   |
| `clickhouse-reference-explain.test.ts`      | `formatExplain(parse(...))`   | `.expected.explain.txt`     | `diff:explain`  |
| `clickhouse-reference-round-trip.test.ts`   | `parse(format(parse(...)))`   | (none — internal stability) | see note below  |

The `diff:*` scripts reproduce *exactly* what each suite compares, then print the
actual output, the expected output, and a colored unified diff (`expected → actual`).

## Workflow

### 1. Identify the failing dimension and case(s)

Run the suite (or read the failure output). Vitest names each failing case by its
`.sql` filename under a `describe` block — e.g. `clickhouse reference - format >
00123_foo.sql`. The `describe` label tells you the dimension; the test name is the
case file.

To re-run a single dimension and filter to one case:

```
npx vitest run tests/clickhouse-reference-format.test.ts -t 00123_foo.sql
```

### 2. Diff that case

Pick the `diff:*` command for the failing dimension and pass the case (the `.sql`
suffix is optional). Start with `--diff-only` for a compact view:

```
npm run diff:format -- 00123_foo --diff-only
```

Drop `--diff-only` to also see the full actual and expected blocks (useful when the
diff hunks lack enough context). Other flags: `--only-diffs` (skip matching cases),
`--actual-only` / `--expected-only`, `--no-color`. `-h` prints usage.

The `<reference>` argument also accepts a comma-separated list or a glob, so you can
diff a batch of failures at once and let `--only-diffs` filter to the broken ones:

```
npm run diff:ast -- '0012*,00200_bar' --only-diffs --diff-only
```

The script exits non-zero if any case differs, so it doubles as a quick check.

### 3. Fix the cause — in the code, never the fixtures

`tests/clickhouse-reference/` and the test files are **fixtures: do not edit them**
to make a test pass. The expected outputs are the source of truth. Fix the
production code so its output matches:

- **`diff:ast` failure** → wrong/missing parse result. Fix `src/grammar.pegjs`
  (PEG rules, not JS), then `npm run generate:parser`. The AST must hold structured
  data, not raw syntax strings (see `CLAUDE.md`).
- **`diff:format` failure** → `src/format.ts`. The formatter must only render AST
  fields — no re-parsing. If it lacks data, the fix may belong in the grammar/AST.
- **`diff:explain` failure** → `src/explain.ts`.

After a grammar change, **always `npm run generate:parser`** before re-diffing — the
`diff:*` scripts import `src/` directly via `tsx` and use the generated
`src/parser.js`.

### 4. Re-verify

Re-run the diff command (expect exit 0 / "no differences"), then the suite:

```
npm run diff:format -- 00123_foo --diff-only
npx vitest run tests/clickhouse-reference-format.test.ts -t 00123_foo.sql
```

Confirm you didn't regress others by running the full dimension suite, since a
grammar/formatter change can affect many cases.

## Notes

- **Explain placeholders:** expected explain files may contain `<Query Parameters>`
  or `<Explain Error>` entries (statements ClickHouse couldn't explain). The suite
  and `diff:explain` skip these, so they never show as diffs.
- **Round-trip failures** have no expected file — they assert `format()` output
  re-parses to the same AST. Diff its two `parse()` results manually: get the
  formatted SQL with `npm run format -- <case>`, then re-parse it with
  `npm run parse -- --sql "<formatted SQL>"` and compare against `npm run parse -- <case>`.
  (`parse`/`format`/`explain` take a reference case as a positional arg, or raw SQL
  via `--sql`.)
- A `<Error> ...` line in the actual block means `parse()`/`format()`/
  `formatExplain()` threw for that case — a parser/formatter crash, not a mismatch.
