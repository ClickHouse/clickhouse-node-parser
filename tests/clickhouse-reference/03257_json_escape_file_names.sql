select * from test;
select json.`a/b/c`, json.`a-b-c`, json.`a-b/c-d/e` from test;
select json.`a/b/c`.:Int64, json.`a-b-c`.:Int64, json.`a-b/c-d/e`.:Int64 from test;
