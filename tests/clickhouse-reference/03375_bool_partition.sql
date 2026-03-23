CREATE TABLE t0 (c0 Bool) ENGINE = MergeTree() ORDER BY tuple() PARTITION BY (c0);
INSERT INTO TABLE t0 (c0) VALUES (FALSE), (TRUE);
SELECT part_name FROM system.parts where table='t0' and database=currentDatabase();
SELECT c0 FROM t0;
