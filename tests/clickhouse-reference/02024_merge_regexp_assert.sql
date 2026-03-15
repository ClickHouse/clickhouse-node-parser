CREATE TABLE t (b UInt8) ENGINE = Memory;
SELECT a FROM merge(REGEXP('.'), '^t$'); -- { serverError UNKNOWN_IDENTIFIER }
SELECT a FROM merge(REGEXP('\0'), '^t$'); -- { serverError UNKNOWN_IDENTIFIER }
SELECT a FROM merge(REGEXP('\0a'), '^t$'); -- { serverError UNKNOWN_IDENTIFIER }
SELECT a FROM merge(REGEXP('\0a'), '^$'); -- { serverError CANNOT_EXTRACT_TABLE_STRUCTURE }
