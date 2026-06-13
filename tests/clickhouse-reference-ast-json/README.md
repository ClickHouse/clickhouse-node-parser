# ClickHouse `EXPLAIN AST json = 1` reference corpus

This directory vendors the curated SQL → JSON-AST fixture corpus from the
upstream ClickHouse "JSON AST with properties" PR, which adds
`EXPLAIN AST json = 1` to ClickHouse:

- **Source PR:** https://github.com/peter-leonov-ch/ClickHouse/pull/1
- **Commit SHA (corpus generated from):** `ad33aa4ceba52f42afb17246cc2778d3733cfb7e`
- **Format version:** 1 (`AST_JSON_FORMAT_VERSION`); any backwards-incompatible
  upstream shape change bumps the version
- **Upstream contract reference:** `AST.md` in the PR branch root
  (https://github.com/peter-leonov-ch/ClickHouse/blob/ad33aa4ceba52f42afb17246cc2778d3733cfb7e/AST.md)

## Layout

`cases/` holds 41 numbered pairs sharing a basename:

- `<name>.sql` — one input statement (the source of truth)
- `<name>.json` — the exact, pretty-printed output of
  `EXPLAIN AST json = 1 <that query>` from the reference ClickHouse build

The corpus is used by `tests/clickhouse-reference-ast-json.test.ts`: each
`.sql` is parsed with this library, converted with `formatExplainJSON()`, and
the resulting `ast` payload is deep-compared (structurally, so key order and
whitespace are irrelevant) against the vendored `.json`.

## Notes on the pinned snapshot

- At the pinned SHA the reference output is the bare AST node (the
  `{ "version": 1, "ast": ... }` document wrapper documented in the PR
  description is emitted by `formatExplainJSON()` but not yet present in
  these fixtures; the test compares the `ast` payload).
- 64-bit integer literal values are emitted as native JSON numbers at the
  pinned SHA (`quote_64bit_integers = false`).

## Regenerating

Once a ClickHouse build containing the PR is available as an image (set
`CLICKHOUSE_IMAGE`), regenerate the `.json` files with:

```bash
npm run generate:ast-json-fixtures
```

The script starts the docker-compose ClickHouse server (or reuses one running
at `CLICKHOUSE_URL`) and runs `EXPLAIN AST json = 1` for each `cases/*.sql`.
Until such an image exists, the vendored copies are the source of truth — do
not hand-edit them.

The upstream PR also carries a bulk `shapes/` corpus (1,440
structurally-distinct statements harvested from the ClickHouse stateless test
suite). It is intentionally not vendored here; it can be used later for
coverage screening rather than hard assertions.
