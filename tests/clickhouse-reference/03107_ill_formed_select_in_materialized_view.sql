CREATE TABLE a ( a UInt64, b UInt64) ENGINE = Memory;
CREATE TABLE b ( b UInt64) ENGINE = Memory;
SET enable_analyzer = 1;
SET joined_subquery_requires_alias = 0;
CREATE MATERIALIZED VIEW view_4 ( bb UInt64, cnt UInt64) Engine=MergeTree ORDER BY bb POPULATE AS SELECT bb, count() AS cnt FROM (SELECT a, b AS j, b AS bb FROM a INNER JOIN (SELECT b AS j, b AS bb FROM b ) USING (j)) GROUP BY bb; -- { serverError UNKNOWN_IDENTIFIER }
