-- Tags: no-fasttest

drop table if exists test;
create table test engine=S3('http://localhost:11111/test/json_data');
drop table test;
create table test engine=S3('http://localhost:11111/test/json_data', NOSIGN);
create table test engine=S3('http://localhost:11111/test/json_data', auto);
create table test engine=S3('http://localhost:11111/test/json_data', auto, 'none');
create table test engine=S3('http://localhost:11111/test/json_data', NOSIGN, auto);
create table test engine=S3('http://localhost:11111/test/json_data', 'test', 'testtest');
create table test engine=S3('http://localhost:11111/test/json_data', NOSIGN, auto, 'none');
create table test engine=S3('http://localhost:11111/test/json_data', 'test', 'testtest', '');
create table test engine=S3('http://localhost:11111/test/json_data', 'test', 'testtest', '', auto);
create table test engine=S3('http://localhost:11111/test/json_data', 'test', 'testtest', auto, 'none');
create table test engine=S3('http://localhost:11111/test/json_data', 'test', 'testtest', '', auto, 'none');
create table test engine=URL('http://localhost:11111/test/json_data');
create table test engine=URL('http://localhost:11111/test/json_data', auto);
create table test engine=URL('http://localhost:11111/test/json_data', auto, 'none');
