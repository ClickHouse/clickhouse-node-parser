CREATE TABLE src_01019(v UInt64) ENGINE = Null;
CREATE TABLE dest_01019(v UInt64) Engine = MergeTree() ORDER BY v;
CREATE MATERIALIZED VIEW pipe_01019 TO dest_01019 AS
SELECT v FROM src_01019;
INSERT INTO src_01019 VALUES (1), (2), (3);
SET allow_experimental_alter_materialized_view_structure = 1;
SELECT * FROM dest_01019 ORDER BY v;
INSERT INTO src_01019 VALUES (42);
