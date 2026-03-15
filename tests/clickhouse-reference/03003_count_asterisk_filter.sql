CREATE TABLE users (uid Int16, name Nullable(String), age Int16) ENGINE=Memory;
SELECT count(name) FILTER (WHERE uid > 2000) FROM users;
SELECT countIf(name, uid > 2000) FROM users;
SELECT count(*) FILTER (WHERE uid > 2000) FROM users;
SELECT countIf(uid > 2000) FROM users;
