#!/usr/bin/env tsx

/**
 * Prints the EXPLAIN AST produced by formatExplain() for one or more reference
 * cases, or for a raw SQL string passed via --sql.
 *
 * Run via: npm run explain -- <reference> [options]
 *          npm run explain -- --sql "<SQL>"     (see --help)
 */

import { computeExplain, parseOutputCli, runOutput } from './diff-lib.js';

const opts = parseOutputCli(process.argv, 'explain', 'EXPLAIN AST output');

runOutput(opts, computeExplain);
