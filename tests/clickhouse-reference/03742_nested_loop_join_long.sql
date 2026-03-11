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
