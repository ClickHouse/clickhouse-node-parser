/**
 * Shared SQL statement splitter used by the reference-corpus maintenance
 * scripts (`filter-reference-queries.ts`, `generate-expected-outputs.ts`).
 *
 * This is intentionally a lightweight, lexer-only splitter — it does not parse
 * SQL. It just walks the input character-by-character, tracking the relevant
 * string/comment contexts so that semicolons inside them don't end a statement.
 */

/**
 * Splits SQL content into individual statements by semicolon.
 *
 * After each semicolon, the rest of that line (e.g. trailing inline comments)
 * is included with the current statement rather than the next one.
 *
 * Recognizes the following contexts in which a semicolon does NOT terminate a
 * statement:
 *   - single-quoted strings (`'...'`, with `''` and `\'` escapes)
 *   - double-quoted identifiers (`"..."`, with `""` and `\"` escapes)
 *   - backtick-quoted identifiers (`` `...` ``, with ``` `` ``` escape)
 *   - dollar-quoted strings (`$tag$...$tag$`, including empty-tag `$$...$$`)
 *   - line comments (`-- ...` until end of line)
 *   - block comments (slash-star ... star-slash)
 */
export function splitStatements(content: string): string[] {
  const statements: string[] = [];
  let current = '';
  let inSingleQuote = false;
  let inDoubleQuote = false;
  let inBacktick = false;
  let dollarTag: string | null = null; // non-null string when inside a dollar-quoted string (e.g. '$$' or '$doc$')
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
