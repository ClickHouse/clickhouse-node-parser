-- { echo On }

-- two tables
select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.b + l.c = m.b * 2)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
-- three tables
select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 inner join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 inner join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
--- three tables, where m table matches one key, so that r table can match only one key as well
select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a inner join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a inner join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
--- three tables, right table matches one key
select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 inner join tab_r r on l.a * 2 = r.a * 2 and l.d = r.d order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l inner join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 inner join tab_r r on l.a * 2 = r.a * 2 and l.d = r.d)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
--- three tables, tab_m table matches noting, so right table can match both keys
select * from tab_l l inner join tab_m m on l.d = m.a inner join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l inner join tab_m m on l.d = m.a inner join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
-- two tables
select * from tab_l l right join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l right join tab_m m on l.a * 2 = m.c + m.d and l.b + l.c = m.b * 2)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
-- three tables
select * from tab_l l left join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 left join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d order by l.a limit 10 offset 999990;
select explain e from (explain actions = 1 select * from tab_l l left join tab_m m on l.a * 2 = m.c + m.d and l.d = m.a and l.b + l.c = m.b * 2 left join tab_r r on l.a * 2 = r.a * 2 and l.b + l.c = r.c * 2 and l.d = r.d)
where e like '%ReadFromMergeTree%' or e like '%Expression%' or e like '%Join%' or e like '%Clauses%' or e like '%Sharding%';
