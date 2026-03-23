-- Tags: no-replicated-database, log-engine
-- Tag no-replicated-database: Different query_id

SET prefer_localhost_replica = 1;
CREATE TABLE tmp ENGINE = TinyLog AS SELECT queryID();
SELECT query FROM system.query_log WHERE query_id = (SELECT * FROM tmp) AND current_database = currentDatabase() LIMIT 1;
CREATE TABLE tmp ENGINE = TinyLog AS SELECT initialQueryID();
SELECT query FROM system.query_log WHERE initial_query_id = (SELECT * FROM tmp) AND current_database = currentDatabase() LIMIT 1;
CREATE TABLE tmp (str String) ENGINE = Log;
INSERT INTO tmp (*) VALUES ('a');
SELECT count() FROM (SELECT initialQueryID() FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp') GROUP BY queryID());
SELECT count() FROM (SELECT queryID() FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp') GROUP BY queryID());
SELECT count() FROM (SELECT queryID() AS t FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp') GROUP BY queryID() HAVING t == initialQueryID());
SELECT count(DISTINCT t) FROM (SELECT initialQueryID() AS t FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp') GROUP BY queryID());
SELECT count(DISTINCT t) FROM (SELECT queryID() AS t FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp') GROUP BY queryID());
