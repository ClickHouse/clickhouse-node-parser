CREATE TABLE td (id Int16, d Date) ENGINE=MergeTree() order by id;
CREATE TABLE tdt (id Int16, dt DateTime) ENGINE=MergeTree() order by id;
SELECT td_d FROM (SELECT t.id td_id, t.d td_d, uniqExact(tdt.id) as cnt FROM td as t LEFT JOIN tdt ON toDate(tdt.dt) = t.d GROUP BY td_id, td_d) WHERE td_d = '2025-04-01';
SELECT td_d FROM (SELECT t.id td_id, t.d td_d, uniqExact(tdt.id) as cnt FROM tdt RIGHT JOIN td as t ON toDate(tdt.dt) = t.d GROUP BY td_id, td_d) WHERE td_d = '2025-04-01';
SELECT td_d FROM (SELECT t.id td_id, t.d td_d, uniqExact(tdt.id) as cnt FROM td as t INNER JOIN tdt ON toDate(tdt.dt) = t.d GROUP BY td_id, td_d) WHERE td_d = '2025-04-01';
SELECT td_d FROM (SELECT t.id td_id, t.d td_d, uniqExact(tdt.id) as cnt FROM tdt INNER JOIN td as t ON toDate(tdt.dt) = t.d GROUP BY td_id, td_d) WHERE td_d = '2025-04-01';
CREATE VIEW v AS
SELECT
  t.id td_id, t.d td_d, uniqExact(tdt.id) as cnt
FROM
  td as t
  LEFT JOIN tdt ON toDate(tdt.dt) = t.d
GROUP BY td_id, td_d;
SELECT td_d FROM v WHERE td_d = '2025-04-01';
