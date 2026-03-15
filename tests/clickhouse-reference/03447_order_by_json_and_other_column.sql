create table test (json JSON) engine=Memory;
select json, materialize('') from test order by all asc;
