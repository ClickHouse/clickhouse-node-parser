CREATE TABLE insert_select_dst (i int, middle_a int, middle_b int, j int) ENGINE = Log;
CREATE TABLE insert_select_src (i int, j int) ENGINE = Log;
SELECT * FROM insert_select_dst;
