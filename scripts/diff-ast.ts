#!/usr/bin/env tsx

/**
 * Shows the AST produced by parse() for one or more reference cases, the expected
 * AST committed in tests/clickhouse-reference, and the diff between them.
 *
 * Run via: npm run diff:ast -- <reference> [options]   (see --help)
 */

import { computeAst, parseCli, run } from './diff-lib.js';

const opts = parseCli(process.argv, 'diff:ast', 'parsed AST vs. expected AST');

run(opts, '.expected.ast.json', (sql) => computeAst(sql));
