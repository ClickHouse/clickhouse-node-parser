select trimLeft(*) from (explain indexes=1 select json from test where json.a = 1) where explain like '%ReadFromMergeTree%';
select json from test where json.a = 1;
select trimLeft(*) from (explain indexes=1 select t from test where t.a = 1) where explain like '%ReadFromMergeTree%';
select t from test where t.a = 1;
select trimLeft(*) from (explain indexes=1 select json from test where json.c[].d.:Int64 = [1]) where explain like '%ReadFromMergeTree%';
select json from test where json.c[].d.:Int64 = [1];
select '------------------------------------------------------------------';
