CREATE TABLE events
(
    `Id` Nullable(UInt64),
    `Payload` String,
    `Time` DateTime,
)
ENGINE = MergeTree
ORDER BY Time
;
CREATE TABLE attributes
(
    `EventId` UInt64,
    `AnotherId` Nullable(UInt64),
    `Attribute` String
)
ENGINE = MergeTree ORDER BY EventId
;
CREATE TABLE events2
(
    `Id` UInt64,
    `Payload` String,
    `Time` DateTime
)
ENGINE = MergeTree
ORDER BY Time
;
CREATE TABLE attributes2
(
    `EventId` UInt64,
    `OtherId` Nullable(UInt32),
    `Attribute` String
)
ENGINE = MergeTree
ORDER BY EventId;
SET query_plan_join_swap_table = 0;
SET enable_analyzer = 1;
SET join_algorithm = 'direct';
SET min_joined_block_size_rows = 0, min_joined_block_size_bytes = 0;
SELECT t0.Id, sum(sipHash64(t0.Payload)), count(), countIf(t1.Attribute != ''), sum(sipHash64(t1.Attribute)) AS attr_hash_sum
FROM events AS t0
JOIN attributes AS t1 ON t0.Id = t1.EventId
GROUP BY t0.Id
ORDER BY t0.Id NULLS FIRST
;
SELECT t0.Id, sum(sipHash64(t0.Payload)), count(), countIf(t1.Attribute != ''), sum(sipHash64(t1.Attribute)) AS attr_hash_sum
FROM events AS t0
LEFT JOIN attributes AS t1 ON t0.Id = t1.EventId
GROUP BY t0.Id
ORDER BY t0.Id NULLS FIRST
;
SELECT t0.Id, sum(sipHash64(t0.Payload)), count(), countIf(t1.Attribute != ''), sum(sipHash64(t1.Attribute)) AS attr_hash_sum
FROM events AS t0
SEMI LEFT JOIN attributes AS t1 ON t0.Id = t1.EventId
GROUP BY t0.Id
ORDER BY t0.Id NULLS FIRST
;
SELECT t0.Id, sum(sipHash64(t0.Payload)), count(), countIf(t1.Attribute != ''), sum(sipHash64(t1.Attribute)) AS attr_hash_sum
FROM events AS t0
ANTI LEFT JOIN attributes AS t1 ON t0.Id = t1.EventId
GROUP BY t0.Id
ORDER BY t0.Id NULLS FIRST
;
SELECT sum(sipHash64(t0.Id, t0.Payload)) AS hash_sum , count() AS cnt
FROM events2 AS t0
JOIN attributes2 AS t1 ON t1.EventId = t0.Id
;
SELECT sum(sipHash64(t0.Id, t0.Payload)) AS hash_sum , count() AS cnt
FROM events2 AS t0
SEMI LEFT JOIN attributes2 AS t1 ON t1.EventId = t0.Id
;
SELECT sum(sipHash64(t0.Id, t0.Payload)) AS hash_sum, count() AS cnt
FROM events2 AS t0
ANTI LEFT JOIN attributes2 AS t1 ON t1.EventId = t0.Id
;
