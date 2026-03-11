select * from test_02245;
select _path from test_02245;
select * from test_02245_2;
select _path, isNotNull(_etag) from test_02245_2;
select count() from test_02245_2 where _etag IN (select _etag from test_02245_2);
