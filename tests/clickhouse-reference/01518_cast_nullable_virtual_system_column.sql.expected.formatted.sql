SELECT database
FROM `system`.tables
WHERE like(database, '%')
FORMAT Null;

SELECT database AS db
FROM `system`.tables
WHERE like(db, '%')
FORMAT Null;

SELECT CAST(database, 'String') AS db
FROM `system`.tables
WHERE like(db, '%')
FORMAT Null;

SELECT CAST('a string', 'Nullable(String)') AS str
WHERE like(str, '%')
FORMAT Null;

SELECT CAST(database, 'Nullable(String)') AS ndb
FROM `system`.tables
WHERE like(ndb, '%')
FORMAT Null;