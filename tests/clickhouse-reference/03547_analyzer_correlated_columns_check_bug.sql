CREATE TABLE users (uid Int16, name String, age Int16) ENGINE=Memory;
CREATE ROW POLICY a ON users FOR SELECT USING arrayExists(a -> a = age, [uid]) TO ALL;
SELECT * FROM users;
