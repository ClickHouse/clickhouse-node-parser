select (select eventTimestamp from datDictionary);
select count(*) from dat where eventTimestamp >= (select eventTimestamp from datDictionary);
