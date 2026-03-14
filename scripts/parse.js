#!/usr/bin/env node
'use strict';

const { parse } = require('../dist/index.js');

const sql = process.argv[2];
if (!sql) {
  process.stderr.write('Usage: npm run parse "<SQL>"\n');
  process.exit(1);
}

try {
  console.log(JSON.stringify(parse(sql), (key, value) => (key === 'parent' ? undefined : value), 2));
} catch (e) {
  process.stderr.write(e.message + '\n');
  process.exit(1);
}
