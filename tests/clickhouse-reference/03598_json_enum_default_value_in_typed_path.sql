create table test (json JSON(e Enum('a' = 1, 'b' = 2))) engine=MergeTree order by tuple();
select json from test;
select json.e from test;
