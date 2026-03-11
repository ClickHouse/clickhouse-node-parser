select '-- no projection';
select trimLeft(explain) as s from (EXPLAIN SELECT * FROM tt0 ORDER BY k ASC LIMIT 10) where s ilike 'LazilyRead%';
SELECT * FROM tt0 ORDER BY k ASC LIMIT 10;
select trimLeft(explain) as s from (EXPLAIN SELECT * FROM tt0 WHERE v = '3' ORDER BY v ASC LIMIT 10) where s ilike 'ReadFromMergeTree (proj_v)';
select trimLeft(explain) as s from (EXPLAIN SELECT * FROM tt0 WHERE v = '3' ORDER BY v ASC LIMIT 10) where s ilike 'LazilyRead%';
SELECT * FROM tt0 WHERE v = '3' ORDER BY v ASC LIMIT 10;
-- check that table has 2 parts without and with projection
select name, projections from system.parts where database = currentDatabase() and table = 'tt1' order by name;
-- reading using projection from the table should have 2 reading steps, - one for part w/o proj and one for part with proj
select 'Reading steps: '|| count() from (EXPLAIN SELECT * FROM tt1 WHERE v = '1001' ORDER BY v ASC LIMIT 10) where trimLeft(explain) ilike 'ReadFromMergeTree%';
-- currently lazy materialization doesn't support such mixed reading
select trimLeft(explain) as s from (EXPLAIN SELECT * FROM tt1 WHERE v = '1001' ORDER BY v ASC LIMIT 10) where s ilike 'LazilyRead%';
