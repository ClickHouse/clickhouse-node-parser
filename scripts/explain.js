#!/usr/bin/env node
'use strict';

const { parse, formatExplain } = require('../dist/index.js');

const sql = process.argv[2];
if (!sql) {
  process.stderr.write('Usage: npm run explain "<SQL>"\n');
  process.exit(1);
}

try {
  console.log(formatExplain(parse(sql)));
} catch (e) {
  process.stderr.write(e.message + '\n');
  process.exit(1);
}
