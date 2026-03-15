CREATE TABLE users (uid Int16, name String, age Int16) ENGINE=Memory;
SELECT uid, count(*) over () FROM users group by ALL FORMAT Null;
