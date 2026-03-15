CREATE TABLE set (x String) ENGINE = Set;
SELECT arrayJoin(['Hello', 'test', 'World', 'world', 'abc', 'xyz']) AS s WHERE s IN set;
SELECT arrayJoin(['Hello', 'test', 'World', 'world', 'abc', 'xyz']) AS s WHERE s NOT IN set;
SELECT arrayJoin(['Hello', 'test', 'World', 'world', 'abc', 'xyz']) AS s WHERE s IN set2;
create table tab (x String) engine = MergeTree order by x as select 'Hello';
SELECT * FROM tab PREWHERE x IN (set) WHERE x IN (set) LIMIT 1 settings enable_analyzer=0;
SELECT * FROM tab PREWHERE x IN (set) WHERE x IN (set) LIMIT 1 settings enable_analyzer=1;
