/**
 * Shared helpers for the reference-case scripts:
 *   - diff:ast / diff:format / diff:explain  — actual vs. expected, with a diff
 *   - parse  / format     / explain          — just this library's output
 *
 * All six resolve the same reference selector (a `.sql` filename, a comma-separated
 * list, or a glob) against `tests/clickhouse-reference/`, and compute output with the
 * same `compute*` functions, so the plain and diff variants can never drift apart.
 */

import * as fs from 'fs';
import * as path from 'path';
import { createTwoFilesPatch } from 'diff';
import { minimatch } from 'minimatch';
import pc from 'picocolors';
import { format, formatExplain, parse } from '../src/index.js';

/** Directory holding the ClickHouse reference `.sql` cases and their expected outputs. */
export const CLICKHOUSE_DIR = new URL('../tests/clickhouse-reference', import.meta.url).pathname;

/** Placeholders the explain reference files use for statements ClickHouse couldn't explain. */
const QUERY_PARAMS = '<Query Parameters>';
const EXPLAIN_ERROR = '<Explain Error>';

// ── Output computation (shared by the plain and diff scripts) ───────────────────

/** Recursively removes `location`, `parent`, and `isOperator` keys, matching tests/helpers.ts. */
export function stripMeta(value: unknown): unknown {
  if (value === null || value === undefined || typeof value !== 'object') return value;
  if (Array.isArray(value)) return value.map(stripMeta);
  const result: Record<string, unknown> = {};
  for (const [k, v] of Object.entries(value as Record<string, unknown>)) {
    if (k === 'location' || k === 'parent' || k === 'isOperator') continue;
    result[k] = stripMeta(v);
  }
  return result;
}

/** AST from `parse()` with `location`/`parent` stripped, as compared by the ast suite. */
export function computeAst(sql: string): string {
  return JSON.stringify(stripMeta(parse(sql)), null, 2);
}

/** Re-formatted SQL from `format(parse(...))`, as compared by the format suite. */
export function computeFormat(sql: string): string {
  return format(parse(sql)).trimEnd();
}

/**
 * EXPLAIN AST from `formatExplain(parse(...))`, as compared by the explain suite.
 *
 * When `expected` is provided, output is aligned to its `\n\n`-separated entries and
 * the `<Query Parameters>` / `<Explain Error>` placeholders are preserved verbatim so
 * they don't surface as spurious diffs (mirroring the explain reference test). When
 * `expected` is null, one explain block is emitted per parsed statement.
 */
export function computeExplain(sql: string, expected: string | null): string {
  const statements = parse(sql);

  if (expected === null) {
    return statements.map((s) => formatExplain([s]).trimEnd()).join('\n\n');
  }

  const expectedEntries = expected.trimEnd().split('\n\n');
  return expectedEntries
    .map((entry, i) => {
      const trimmed = entry.trimEnd();
      if (trimmed === QUERY_PARAMS || trimmed === EXPLAIN_ERROR) return trimmed;
      if (i >= statements.length) return `<Error> no statement at index ${i}`;
      return formatExplain([statements[i]]).trimEnd();
    })
    .join('\n\n');
}

/** Signature shared by every `compute*` function; `expected` is only used by explain. */
export type Compute = (sql: string, expected: string | null) => string;

// ── Reference resolution ────────────────────────────────────────────────────────

/**
 * Resolves the reference selector into a sorted, de-duplicated list of `.sql`
 * filenames present in {@link CLICKHOUSE_DIR}.
 *
 * The selector may be a single filename, a comma-separated list, or a glob
 * pattern (matched against the `.sql` filenames). The `.sql` suffix is optional
 * for exact-name matches.
 */
export function resolveReferences(selector: string, dir: string = CLICKHOUSE_DIR): string[] {
  if (!fs.existsSync(dir)) {
    throw new Error(`Reference directory not found: ${dir}`);
  }

  const allCases = fs
    .readdirSync(dir)
    .filter((f) => f.endsWith('.sql') && !f.includes('.expected.'));
  const caseSet = new Set(allCases);

  const matched = new Set<string>();
  for (const rawPart of selector.split(',')) {
    const part = rawPart.trim();
    if (!part) continue;

    const withSql = part.endsWith('.sql') ? part : `${part}.sql`;

    if (caseSet.has(part)) {
      matched.add(part);
    } else if (caseSet.has(withSql)) {
      matched.add(withSql);
    } else {
      // Treat as a glob. Match against both the raw pattern and a `.sql`-suffixed
      // variant so `0001*` matches `0001*.sql`.
      const patterns = [part, withSql];
      let any = false;
      for (const c of allCases) {
        if (patterns.some((p) => minimatch(c, p))) {
          matched.add(c);
          any = true;
        }
      }
      if (!any) {
        process.stderr.write(pc.yellow(`No reference cases matched: ${part}\n`));
      }
    }
  }

  return [...matched].sort();
}

// ── Rendering ────────────────────────────────────────────────────────────────────

const useColor = (o: { noColor: boolean }) => !o.noColor;

/** Prints a section header rule, optionally colored. */
function header(text: string, o: { noColor: boolean }): string {
  const line = `── ${text} ${'─'.repeat(Math.max(0, 72 - text.length))}`;
  return useColor(o) ? pc.bold(pc.blue(line)) : line;
}

function stripAnsi(s: string): string {
  // eslint-disable-next-line no-control-regex
  return s.replace(/\[[0-9;]*m/g, '');
}

function colorizeDiff(patch: string, o: { noColor: boolean }): string {
  if (!useColor(o)) return patch;
  return patch
    .split('\n')
    .map((line) => {
      if (line.startsWith('@@')) return pc.cyan(line);
      if (line.startsWith('+')) return pc.green(line);
      if (line.startsWith('-')) return pc.red(line);
      return pc.dim(line);
    })
    .join('\n');
}

// ── Diff scripts (diff:ast / diff:format / diff:explain) ──────────────────────────

export interface CliOptions {
  /** The positional reference selector (filename, comma list, or glob). */
  selector: string;
  /** Print the actual output section. */
  showActual: boolean;
  /** Print the expected output section. */
  showExpected: boolean;
  /** Print the diff section. */
  showDiff: boolean;
  /** Disable ANSI colors. */
  noColor: boolean;
  /** Only print cases whose actual and expected differ. */
  onlyDiffs: boolean;
}

/**
 * Parses argv for the diff scripts.
 *
 * Usage: <script> <reference> [options]
 * Options: --actual-only, --expected-only, --diff-only, --only-diffs, --no-color, -h.
 */
export function parseCli(argv: string[], scriptName: string, what: string): CliOptions {
  const args = argv.slice(2);

  if (args.includes('-h') || args.includes('--help')) {
    printDiffUsage(scriptName, what);
    process.exit(0);
  }

  const flags = new Set(args.filter((a) => a.startsWith('-')));
  const positionals = args.filter((a) => !a.startsWith('-'));

  if (positionals.length === 0) {
    printDiffUsage(scriptName, what);
    process.exit(1);
  }

  const actualOnly = flags.has('--actual-only');
  const expectedOnly = flags.has('--expected-only');
  const diffOnly = flags.has('--diff-only');
  const anyOnly = actualOnly || expectedOnly || diffOnly;

  return {
    selector: positionals.join(','),
    // When no `--*-only` flag is given, show all three sections.
    showActual: anyOnly ? actualOnly : true,
    showExpected: anyOnly ? expectedOnly : true,
    showDiff: anyOnly ? diffOnly : true,
    noColor: flags.has('--no-color') || !process.stdout.isTTY,
    onlyDiffs: flags.has('--only-diffs'),
  };
}

function printDiffUsage(scriptName: string, what: string): void {
  process.stderr.write(
    `Show ${what} for one or more ClickHouse reference cases.\n\n` +
      `Usage: npm run ${scriptName} -- <reference> [options]\n\n` +
      `  <reference>  A reference .sql filename (the .sql suffix is optional),\n` +
      `               a comma-separated list of filenames, or a glob pattern.\n` +
      `               Examples: 00001_select_1\n` +
      `                         00001_select_1.sql,00002_count_visits.sql\n` +
      `                         '0001*_select*'\n\n` +
      `Options:\n` +
      `  --actual-only     Show only this library's output.\n` +
      `  --expected-only   Show only the expected output.\n` +
      `  --diff-only       Show only the diff.\n` +
      `  --only-diffs      Skip cases where actual matches expected.\n` +
      `  --no-color        Disable ANSI colors.\n` +
      `  -h, --help        Show this help.\n`,
  );
}

interface CaseResult {
  fileName: string;
  actual: string;
  expected: string | null;
  expectedPath: string;
}

/**
 * Renders one case (actual / expected / diff) to stdout according to `opts`.
 * Returns true if the actual and expected outputs differ.
 */
function renderCase(result: CaseResult, opts: CliOptions): boolean {
  const { fileName, actual, expected, expectedPath } = result;

  const differs = expected === null || actual.trimEnd() !== expected.trimEnd();

  if (opts.onlyDiffs && !differs) return false;

  const status = expected === null ? pc.yellow('no expected file') : differs ? pc.red('DIFF') : pc.green('match');
  const titleBar = `━━━ ${fileName} ━━━ ${useColor(opts) ? status : stripAnsi(status)}`;
  process.stdout.write('\n' + (useColor(opts) ? pc.bold(titleBar) : titleBar) + '\n');

  if (opts.showActual) {
    process.stdout.write('\n' + header('actual', opts) + '\n');
    process.stdout.write(actual.replace(/\n*$/, '') + '\n');
  }

  if (opts.showExpected) {
    process.stdout.write('\n' + header('expected', opts) + '\n');
    if (expected === null) {
      process.stdout.write(pc.yellow(`(missing: ${path.basename(expectedPath)})`) + '\n');
    } else {
      process.stdout.write(expected.replace(/\n*$/, '') + '\n');
    }
  }

  if (opts.showDiff) {
    process.stdout.write('\n' + header('diff (expected → actual)', opts) + '\n');
    if (expected === null) {
      process.stdout.write(pc.yellow('(no expected file to diff against)') + '\n');
    } else if (!differs) {
      process.stdout.write(pc.dim('(no differences)') + '\n');
    } else {
      const patch = createTwoFilesPatch(
        'expected',
        'actual',
        expected.replace(/\n*$/, '') + '\n',
        actual.replace(/\n*$/, '') + '\n',
        undefined,
        undefined,
        { context: 3 },
      );
      process.stdout.write(colorizeDiff(patch, opts) + '\n');
    }
  }

  return differs;
}

/**
 * Top-level runner for the diff scripts. Resolves references, computes each case via
 * `compute`, renders them, and prints a summary / sets exit code.
 */
/** Optional corpus layout overrides for {@link run}. */
export interface RunLayout {
  /** Directory holding the `.sql` cases. Defaults to {@link CLICKHOUSE_DIR}. */
  dir?: string;
  /** Maps a case's `.sql` path to its expected-output path. Defaults to appending the suffix. */
  expectedPathFor?: (sqlPath: string) => string;
  /** Normalizes the raw expected file contents before comparison/diffing. */
  normalizeExpected?: (expected: string) => string;
}

export function run(
  opts: CliOptions,
  expectedSuffix: string,
  compute: Compute,
  layout: RunLayout = {},
): void {
  const dir = layout.dir ?? CLICKHOUSE_DIR;
  const files = resolveReferences(opts.selector, dir);

  if (files.length === 0) {
    process.stderr.write(pc.red('No reference cases matched the given selector.\n'));
    process.exit(1);
  }

  let diffCount = 0;
  let shown = 0;

  for (const fileName of files) {
    const sqlPath = path.join(dir, fileName);
    const expectedPath = layout.expectedPathFor
      ? layout.expectedPathFor(sqlPath)
      : `${sqlPath}${expectedSuffix}`;
    let expected = fs.existsSync(expectedPath) ? fs.readFileSync(expectedPath, 'utf-8') : null;
    if (expected !== null && layout.normalizeExpected) expected = layout.normalizeExpected(expected);

    let actual: string;
    try {
      actual = compute(fs.readFileSync(sqlPath, 'utf-8'), expected);
    } catch (e) {
      actual = `<Error> ${e instanceof Error ? e.message : String(e)}`;
    }

    const differs = renderCase({ fileName, actual, expected, expectedPath }, opts);
    if (differs) diffCount++;
    if (!opts.onlyDiffs || differs) shown++;
  }

  process.stdout.write(
    '\n' +
      pc.bold(
        `Summary: ${files.length} case(s) checked, ${diffCount} with differences` +
          (opts.onlyDiffs ? `, ${shown} shown` : '') +
          '.\n',
      ),
  );

  process.exit(diffCount > 0 ? 1 : 0);
}

// ── Plain output scripts (parse / format / explain) ───────────────────────────────

export interface OutputCliOptions {
  /** The positional reference selector (empty when `--sql` is used). */
  selector: string;
  /** Raw SQL passed via `--sql`, or null to read from reference files. */
  sql: string | null;
  /** Disable ANSI colors. */
  noColor: boolean;
}

/**
 * Parses argv for the plain output scripts.
 *
 * Usage: <script> <reference> [options]
 *        <script> --sql "<SQL>" [options]
 * Options: --sql <SQL>, --no-color, -h.
 */
export function parseOutputCli(argv: string[], scriptName: string, what: string): OutputCliOptions {
  const args = argv.slice(2);

  if (args.includes('-h') || args.includes('--help')) {
    printOutputUsage(scriptName, what);
    process.exit(0);
  }

  let sql: string | null = null;
  const positionals: string[] = [];
  const flags = new Set<string>();

  for (let i = 0; i < args.length; i++) {
    const a = args[i];
    if (a === '--sql') {
      sql = args[++i] ?? '';
    } else if (a.startsWith('--sql=')) {
      sql = a.slice('--sql='.length);
    } else if (a.startsWith('-')) {
      flags.add(a);
    } else {
      positionals.push(a);
    }
  }

  if (sql === null && positionals.length === 0) {
    printOutputUsage(scriptName, what);
    process.exit(1);
  }

  return {
    selector: positionals.join(','),
    sql,
    noColor: flags.has('--no-color') || !process.stdout.isTTY,
  };
}

function printOutputUsage(scriptName: string, what: string): void {
  process.stderr.write(
    `Show this library's ${what} for one or more ClickHouse reference cases, or for raw SQL.\n\n` +
      `Usage: npm run ${scriptName} -- <reference> [options]\n` +
      `       npm run ${scriptName} -- --sql "<SQL>" [options]\n\n` +
      `  <reference>  A reference .sql filename (the .sql suffix is optional),\n` +
      `               a comma-separated list of filenames, or a glob pattern.\n` +
      `               Examples: 00001_select_1\n` +
      `                         00001_select_1.sql,00002_count_visits.sql\n` +
      `                         '0001*_select*'\n\n` +
      `Options:\n` +
      `  --sql <SQL>   Use a raw SQL string instead of reference files.\n` +
      `  --no-color    Disable ANSI colors.\n` +
      `  -h, --help    Show this help.\n`,
  );
}

/**
 * Top-level runner for the plain output scripts. With `--sql`, computes and prints
 * output for the given SQL. Otherwise resolves the reference selector and prints each
 * case's output, prefixed with a filename header when more than one case matches.
 */
export function runOutput(opts: OutputCliOptions, compute: Compute): void {
  if (opts.sql !== null) {
    process.stdout.write(compute(opts.sql, null).replace(/\n*$/, '') + '\n');
    return;
  }

  const files = resolveReferences(opts.selector);
  if (files.length === 0) {
    process.stderr.write(pc.red('No reference cases matched the given selector.\n'));
    process.exit(1);
  }

  let errors = 0;
  for (const fileName of files) {
    const sqlPath = path.join(CLICKHOUSE_DIR, fileName);

    let actual: string;
    try {
      actual = compute(fs.readFileSync(sqlPath, 'utf-8'), null);
    } catch (e) {
      actual = `<Error> ${e instanceof Error ? e.message : String(e)}`;
      errors++;
    }

    if (files.length > 1) {
      process.stdout.write('\n' + header(fileName, opts) + '\n');
    }
    process.stdout.write(actual.replace(/\n*$/, '') + '\n');
  }

  process.exit(errors > 0 ? 1 : 0);
}
