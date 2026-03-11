#!/usr/bin/env node

/**
 * Filters each .sql file in clickhouse-tests/, keeping only SELECT statements.
 * Non-SELECT statements (CREATE, DROP, INSERT, SET, etc.) are removed.
 * Non-.sql/txt/json files are removed entirely.
 * Empty .sql files (after filtering) are removed.
 */

import { readFileSync, writeFileSync, readdirSync, unlinkSync } from 'fs';
import { join } from 'path';

const dir = new URL('../clickhouse-tests', import.meta.url).pathname;

// Step 1: Remove all non-.sql and non-.txt files
const allFiles = readdirSync(dir);
let otherRemoved = 0;
for (const file of allFiles) {
  if (!file.endsWith('.sql') && !file.endsWith('.txt') && !file.endsWith('.json')) {
    unlinkSync(join(dir, file));
    otherRemoved++;
  }
}

/**
 * Splits SQL content into individual statements by semicolon.
 * After each semicolon, the rest of that line (e.g. trailing inline comments)
 * is included with the current statement rather than the next one.
 */
function splitStatements(content) {
  const statements = [];
  let current = '';
  let inSingleQuote = false;
  let inDoubleQuote = false;
  let inLineComment = false;
  let inBlockComment = false;

  for (let i = 0; i < content.length; i++) {
    const ch = content[i];
    const next = content[i + 1];

    if (inLineComment) {
      current += ch;
      if (ch === '\n') inLineComment = false;
      continue;
    }

    if (inBlockComment) {
      current += ch;
      if (ch === '*' && next === '/') {
        current += next;
        i++;
        inBlockComment = false;
      }
      continue;
    }

    if (!inSingleQuote && !inDoubleQuote) {
      if (ch === '-' && next === '-') {
        inLineComment = true;
        current += ch;
        continue;
      }
      if (ch === '/' && next === '*') {
        inBlockComment = true;
        current += ch;
        continue;
      }
    }

    if (ch === "'" && !inDoubleQuote) {
      inSingleQuote = !inSingleQuote;
    } else if (ch === '"' && !inSingleQuote) {
      inDoubleQuote = !inDoubleQuote;
    }

    if (ch === ';' && !inSingleQuote && !inDoubleQuote) {
      // Consume the rest of the line so inline trailing comments stay with
      // this statement rather than being prepended to the next one.
      let tail = ';';
      i++;
      while (i < content.length && content[i] !== '\n') {
        tail += content[i];
        i++;
      }
      statements.push(current + tail);
      current = '';
    } else {
      current += ch;
    }
  }

  // Any trailing content without a semicolon
  if (current.trim()) {
    statements.push(current);
  }

  return statements;
}

/**
 * Returns the SQL keyword at the start of a statement, ignoring leading
 * whitespace, line comments, and block comments.
 */
function getLeadingKeyword(statement) {
  // Remove block comments
  let s = statement.replace(/\/\*[\s\S]*?\*\//g, '');
  // Remove line comments
  s = s.replace(/--[^\n]*/g, '');
  // Trim and get first word
  s = s.trim();
  const match = s.match(/^(\w+)/);
  return match ? match[1].toUpperCase() : '';
}

function isSelectStatement(statement) {
  return getLeadingKeyword(statement) === 'SELECT';
}

/**
 * Returns a normalized key for deduplication: strips trailing inline comments,
 * collapses whitespace, and lowercases.
 */
function normalizeStatement(statement) {
  // Strip the trailing inline comment (everything after the semicolon on the last line)
  let s = statement.replace(/;[^\n]*$/, '');
  // Remove block comments
  s = s.replace(/\/\*[\s\S]*?\*\//g, '');
  // Remove line comments
  s = s.replace(/--[^\n]*/g, '');
  // Collapse whitespace and lowercase
  return s.replace(/\s+/g, ' ').trim().toLowerCase();
}

/** Returns true if the statement is just SELECT '<string>' with nothing else. */
function isStringOnlySelect(statement) {
  return /^select\s+('[^']*'|"[^"]*")$/.test(normalizeStatement(statement));
}

/** Returns true if the statement's trailing inline comment contains "clientError". */
function hasClientError(statement) {
  return /;\s*--[^\n]*clientError/.test(statement);
}

/** Returns true if the statement uses the implicit_transaction setting. */
function hasImplicitTransaction(statement) {
  return /implicit_transaction/.test(statement);
}

// Step 2: Filter .sql files
const sqlFiles = readdirSync(dir).filter((f) => f.endsWith('.sql') && !f.includes('.expected.'));
let totalRemoved = 0;
let totalDuplicates = 0;
let filesModified = 0;

for (const file of sqlFiles) {
  const filePath = join(dir, file);
  const content = readFileSync(filePath, 'utf8');
  const statements = splitStatements(content);

  const selectStatements = statements.filter(
    (s) =>
      isSelectStatement(s) &&
      !isStringOnlySelect(s) &&
      !hasClientError(s) &&
      !hasImplicitTransaction(s),
  );
  const removed = statements.length - selectStatements.length;

  // Deduplicate: keep only the first occurrence of each normalized statement
  const seen = new Set();
  const dedupedStatements = selectStatements.filter((s) => {
    const key = normalizeStatement(s);
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });
  const duplicates = selectStatements.length - dedupedStatements.length;

  if (removed > 0 || duplicates > 0) {
    totalRemoved += removed;
    totalDuplicates += duplicates;
    filesModified++;

    if (dedupedStatements.length === 0) {
      // Step 3: Remove files that are now empty
      unlinkSync(filePath);
    } else {
      const newContent = dedupedStatements.map((s) => s.trim()).join('\n') + '\n';
      writeFileSync(filePath, newContent, 'utf8');
    }
  }
}

// Step 4: Remove orphaned .expected.* files with no corresponding input .sql file
const inputFiles = new Set(
  readdirSync(dir).filter((f) => f.endsWith('.sql') && !f.includes('.expected.')),
);
let orphansRemoved = 0;
for (const file of readdirSync(dir)) {
  if (!file.includes('.expected.')) continue;
  // Derive the input filename: strip everything from ".expected." onward.
  const inputFile = file.slice(0, file.indexOf('.expected.'));
  if (!inputFiles.has(inputFile)) {
    unlinkSync(join(dir, file));
    orphansRemoved++;
  }
}

console.log(`Removed ${otherRemoved} .sh/.j2/.data files.`);
console.log(`Removed ${orphansRemoved} orphaned .expected.* files.`);
console.log(
  `Modified ${filesModified} .sql files, removed ${totalRemoved} non-SELECT statements, ${totalDuplicates} duplicates.`,
);
