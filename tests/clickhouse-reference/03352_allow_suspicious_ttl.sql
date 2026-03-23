-- Tags: long, zookeeper

-- Replicated

SET allow_suspicious_ttl_expressions = 0;
DROP TABLE IF EXISTS replicated_ttl_00933 SYNC;
-- Create
CREATE TABLE replicated_ttl_00933 (a Int32, d DateTime)
  ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/test_ttl_00933', 'r1')
  ORDER BY a PARTITION BY tuple() TTL now() + INTERVAL 1 second;  -- { serverError BAD_ARGUMENTS }
SET allow_suspicious_ttl_expressions = 1;
ALTER TABLE replicated_ttl_00933 MODIFY TTL now() + interval 1 day; -- { serverError BAD_ARGUMENTS }
CREATE TABLE replicated_ttl_00933 
(
    a Int32 TTL now() + INTERVAL 1 second,
    d DateTime 
)
ENGINE=ReplicatedMergeTree('/clickhouse/tables/{database}/test_ttl_00933', 'r1')
ORDER BY d;  -- { serverError BAD_ARGUMENTS }
ALTER TABLE replicated_ttl_00933 MODIFY COLUMN a Int32 TTL now() + INTERVAL 1 day; -- { serverError BAD_ARGUMENTS }
