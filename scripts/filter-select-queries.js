#!/usr/bin/env node

/**
 * Filters each .sql file in clickhouse-tests/, keeping only SELECT statements.
 * Non-SELECT statements (CREATE, DROP, INSERT, SET, etc.) are removed.
 * Non-.sql/txt/json files are removed entirely.
 * Empty .sql files (after filtering) are removed.
 */

import { readFileSync, writeFileSync, readdirSync, unlinkSync } from 'fs';
import { join } from 'path';

const dir = new URL('../tests/clickhouse-reference', import.meta.url).pathname;

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
  let inBacktick = false;
  let dollarTag = null; // non-null string when inside a dollar-quoted string (e.g. '$$' or '$doc$')
  let inLineComment = false;
  let inBlockComment = false;

  for (let i = 0; i < content.length; i++) {
    const ch = content[i];
    const next = content[i + 1];

    // Dollar-quoted strings: $tag$...$tag$ (tag may be empty, e.g. $$...$$)
    if (dollarTag !== null) {
      current += ch;
      if (ch === '$' && content.substring(i, i + dollarTag.length) === dollarTag) {
        current += content.substring(i + 1, i + dollarTag.length);
        i += dollarTag.length - 1;
        dollarTag = null;
      }
      continue;
    }

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

    if (!inSingleQuote && !inDoubleQuote && !inBacktick) {
      if (ch === '$') {
        // Match $tag$ where tag is [a-zA-Z0-9_]* (may be empty for $$)
        const tagMatch = content.substring(i).match(/^\$([a-zA-Z0-9_]*)\$/);
        if (tagMatch) {
          dollarTag = tagMatch[0];
          current += dollarTag;
          i += dollarTag.length - 1;
          continue;
        }
      }
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

    if (ch === '\\' && (inSingleQuote || inDoubleQuote)) {
      // Backslash escape: consume the next character as-is.
      current += ch;
      if (i + 1 < content.length) current += content[++i];
      continue;
    } else if (ch === '`' && !inSingleQuote && !inDoubleQuote) {
      // Backtick-quoted identifiers: `` is an escaped backtick inside backticks.
      if (inBacktick && next === '`') {
        current += ch + next;
        i++;
        continue;
      }
      inBacktick = !inBacktick;
    } else if (ch === "'" && !inDoubleQuote && !inBacktick) {
      // SQL-style '' escaped quote: stay inside the string.
      if (inSingleQuote && next === "'") {
        current += ch + next;
        i++;
        continue;
      }
      inSingleQuote = !inSingleQuote;
    } else if (ch === '"' && !inSingleQuote && !inBacktick) {
      if (inDoubleQuote && next === '"') {
        current += ch + next;
        i++;
        continue;
      }
      inDoubleQuote = !inDoubleQuote;
    }

    if (ch === ';' && !inSingleQuote && !inDoubleQuote && !inBacktick) {
      // Consume trailing whitespace and an optional inline comment so they
      // stay with this statement rather than being prepended to the next one.
      // Stop if we hit a non-whitespace, non-comment character (i.e. another
      // statement on the same line).
      let tail = ';';
      let j = i + 1;
      while (j < content.length && content[j] !== '\n') {
        if (content[j] === '-' && content[j + 1] === '-') {
          while (j < content.length && content[j] !== '\n') {
            tail += content[j];
            j++;
          }
          break;
        } else if (content[j] === ' ' || content[j] === '\t') {
          tail += content[j];
          j++;
        } else {
          break;
        }
      }
      i = j - 1;
      statements.push(current + tail);
      current = '';
    } else {
      current += ch;
    }
  }

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

function isSupportedStatement(statement) {
  return ['SELECT', 'SET', 'CREATE', 'USE', 'INSERT', 'DROP', 'ALTER', 'WITH', 'TRUNCATE', 'DROP'].includes(getLeadingKeyword(statement));
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
  return /;\s*--[^\n]*(clientError)/.test(statement);
}

/** Returns true if the statement uses a disallowed setting. */
function hasDisallowedSetting(statement) {
  return /implicit_transaction/.test(statement) ||
    /output_format_tsv_crlf_end_of_line/.test(statement);
}

/** Returns true if the statement uses a disallowed setting. */
function hasKql(statement) {
  return /kql\(/.test(statement);
}

const blocklist = [
  // Ridiculous inputs
  '03775_too_large_temporary_files_buffer_size.sql',
  '02686_bson3.sql',
  '01666_blns_long.sql',
  // Expected Parse error
  '02474_fix_function_parser_bug.sql',
  // Experimental window views, may be supported in the future
  '01049_window_view_window_functions.sql',
  // KQL parsing
  '02366_kql_operator_in_sql.sql',
  // Difficult to split
  // '03011_definitive_guide_to_cast.sql',
];

// Step 2: Remove blocklisted files
for (const stem of blocklist) {
  for (const file of readdirSync(dir)) {
    if (file.startsWith(stem)) {
      unlinkSync(join(dir, file));
    }
  }
}

// Step 3: Filter .sql files
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
      isSupportedStatement(s) &&
      !isStringOnlySelect(s) &&
      !hasClientError(s) &&
      !hasDisallowedSetting(s) && !hasKql(s),
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
