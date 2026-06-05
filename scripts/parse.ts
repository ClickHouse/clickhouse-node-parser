#!/usr/bin/env tsx

/**
 * Prints the AST produced by parse() (with location/parent stripped) for one or
 * more reference cases, or for a raw SQL string passed via --sql.
 *
 * Run via: npm run parse -- <reference> [options]
 *          npm run parse -- --sql "<SQL>"     (see --help)
 */

import { computeAst, parseOutputCli, runOutput } from './diff-lib.js';

const opts = parseOutputCli(process.argv, 'parse', 'parsed AST');

runOutput(opts, (sql) => computeAst(sql));
