CREATE TABLE non_ascii (`привет` String, `мир` String) ENGINE = TinyLog;
INSERT INTO non_ascii VALUES ('hello', 'world');
SELECT `привет` FROM non_ascii;
SELECT * FROM non_ascii;
