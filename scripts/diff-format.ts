#!/usr/bin/env tsx

/**
 * Shows the SQL produced by format() for one or more reference cases, the expected
 * formatted SQL committed in tests/clickhouse-reference, and the diff between them.
 *
 * Run via: npm run diff:format -- <reference> [options]   (see --help)
 */

import { computeFormat, parseCli, run } from './diff-lib.js';

const opts = parseCli(process.argv, 'diff:format', 'format() output vs. expected formatted SQL');

run(opts, '.expected.formatted.sql', (sql) => computeFormat(sql));
