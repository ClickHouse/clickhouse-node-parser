SELECT trimLeft(*) FROM (explain select sum(b) from pr_t group by a order by a limit 5 offset 500) WHERE explain LIKE '%ReadFromMergeTree%';
select sum(b) from pr_t group by a order by a limit 5 offset 500;
