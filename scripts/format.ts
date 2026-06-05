#!/usr/bin/env tsx

/**
 * Prints the SQL produced by format() for one or more reference cases, or for a
 * raw SQL string passed via --sql.
 *
 * Run via: npm run format -- <reference> [options]
 *          npm run format -- --sql "<SQL>"     (see --help)
 */

import { computeFormat, parseOutputCli, runOutput } from './diff-lib.js';

const opts = parseOutputCli(process.argv, 'format', 'formatted SQL');

runOutput(opts, (sql) => computeFormat(sql));
