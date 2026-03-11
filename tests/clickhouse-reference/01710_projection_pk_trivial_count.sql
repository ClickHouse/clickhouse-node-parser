select trimLeft(*) from (explain select count() from x where (i >= 3 and i <= 6) or i = 7) where explain like '%ReadFromPreparedSource%' or explain like '%ReadFromMergeTree%';
select count() from x where (i >= 3 and i <= 6) or i = 7;
