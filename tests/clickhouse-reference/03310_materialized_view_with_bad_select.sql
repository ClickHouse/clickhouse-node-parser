SET allow_materialized_view_with_bad_select = 1;
CREATE TABLE src (x int, y int) ENGINE = MergeTree ORDER BY ();
CREATE TABLE dst (x int, z int) ENGINE = MergeTree ORDER BY ();
CREATE MATERIALIZED VIEW mv TO dst AS SELECT x, y FROM src;
SELECT * FROM dst;
SET allow_materialized_view_with_bad_select = 0;
SELECT * FROM dst ORDER BY ALL;
CREATE MATERIALIZED VIEW mv TO nonexistent AS SELECT x, y FROM src;
