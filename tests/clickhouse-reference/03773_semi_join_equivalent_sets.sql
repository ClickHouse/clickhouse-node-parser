SELECT explain FROM (
    EXPLAIN actions = 1
    SELECT * FROM users LEFT ANY JOIN (SELECT number FROM numbers(10)) as t2 ON users.uid = t2.number WHERE t2.number = 0
) WHERE explain ilike '%Type:%' OR explain ilike '%Strictness%' OR explain ilike '%filter column%';
SELECT explain FROM (
  EXPLAIN actions = 1 SELECT * FROM users LEFT ANY JOIN (SELECT number FROM numbers(10)) as t2 ON users.uid = t2.number WHERE t2.number = 1
) WHERE explain ilike '%Type:%' OR explain ilike '%Strictness%' OR explain ilike '%filter column%';
SELECT '--';
SELECT explain FROM (
  EXPLAIN actions = 1 SELECT * FROM users LEFT SEMI JOIN (SELECT number FROM numbers(10)) as t2 ON users.uid = t2.number WHERE users.uid = 1
) WHERE explain ilike '%Type:%' OR explain ilike '%Strictness%' OR explain ilike '%filter column%';
SELECT explain FROM (
  EXPLAIN actions = 1 SELECT * FROM users RIGHT ANY JOIN (SELECT number FROM numbers(10)) as t2 ON users.uid = t2.number WHERE users.uid = 1
) WHERE explain ilike '%Type:%' OR explain ilike '%Strictness%' OR explain ilike '%filter column%';
SELECT explain FROM (
  EXPLAIN actions = 1 SELECT * FROM users RIGHT SEMI JOIN (SELECT number FROM numbers(10)) as t2 ON users.uid = t2.number WHERE t2.number = 1
) WHERE explain ilike '%Type:%' OR explain ilike '%Strictness%' OR explain ilike '%filter column%';
