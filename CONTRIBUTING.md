# Contributing

## Prerequisites

- Node.js >= 18
- npm >= 9

## Setup

```bash
npm install
```

## Commands

### `npm run generate:parser`

Re-generates the parser from the Peggy Grammar. Run this whenever changing the grammar.

### `npm run build`

Compiles the library to `dist/` using [tsup](https://tsup.egoist.dev/). Outputs both CommonJS (`dist/index.js`) and ESM (`dist/index.mjs`) formats, along with TypeScript declaration files.

### `npm run typecheck`

Runs `tsc --noEmit` to check types without emitting any files.

### `npm test`

Runs the Vitest test suite. See the [tests/ README](./tests/README.md) for more information on testing.

### `npm run lint`

Runs ESLint across all source files.

### `npm run lint:fix`

Runs ESLint and automatically fixes any fixable issues.

### `npm run parse` / `format` / `explain`

Print this library's parse / format / explain output for a raw SQL string (`--sql "SELECT 1"`) or for one or more reference cases in `tests/clickhouse-reference/` (a `.sql` filename, comma-separated list, or glob). Run via `tsx` against `src/`, so no build is needed.

### `npm run diff:ast` / `diff:format` / `diff:explain`

Show this library's output, the expected output committed in `tests/clickhouse-reference/`, and a diff between them for the given reference case(s) — useful for debugging reference test failures. Accept the same reference selector plus `--diff-only`, `--actual-only`, `--expected-only`, `--only-diffs`, and `--no-color`. Pass `-h` to any of these scripts for full usage.

### `npm run release`

Publishes the package to npm with public access. Requires you to be authenticated (`npm login`) and have publish rights to the package.

> `prepublishOnly` runs automatically before publishing and executes `typecheck`, `lint`, `test`, and `build` in sequence. The publish will abort if any of these fail.

## Development Workflow

1. Make changes in `src/`.
2. Add or update tests in `tests/*.test.ts`.
3. Run `npm test` to verify tests pass.
4. Run `npm run typecheck` to verify types.
5. Run `npm run lint:fix` to clean up style (Prettier runs via ESLint).
6. Run `npm run build` to verify the build succeeds.

## Releasing a New Version

1. Update the version in `package.json` following [semver](https://semver.org/).
2. Authenticate with npm if needed: `npm login`
3. Run `npm run release`.

The `prepublishOnly` script will run all checks automatically before publishing.
