create table tlb (k UInt64) engine MergeTree order by k;
-- { echoOn }
-- with limit
SELECT k
FROM remote('127.0.0.{2,3}', currentDatabase(), tlb)
ORDER BY k ASC
LIMIT 1 BY k
LIMIT 100;
-- w/o limit
SELECT k
FROM remote('127.0.0.{2,3}', currentDatabase(), tlb)
ORDER BY k ASC
LIMIT 1 BY k;
