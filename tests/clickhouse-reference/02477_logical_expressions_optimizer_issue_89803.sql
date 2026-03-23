CREATE TABLE tab_int
(
    `col_int` UInt64
)
ENGINE = MergeTree
ORDER BY tuple();
INSERT INTO tab_int VALUES (1), (2);
SELECT count() FROM tab_int WHERE col_int = 1 AND col_int = 2;
SELECT count() FROM tab_int WHERE col_int = 1 AND col_int = '2';
SELECT count() FROM tab_int WHERE col_int = '1' AND col_int = 2;
SELECT count() FROM tab_int WHERE col_int = 1;
SELECT count() FROM tab_int WHERE col_int = '1';
SELECT count() FROM tab_int WHERE col_int = 1 AND col_int = '1';
SELECT count() FROM tab_int WHERE col_int = '1' AND col_int = 1;
SELECT count() FROM tab_int WHERE col_int = '1' AND (col_int = 1 OR col_int = 2);
SELECT count() FROM tab_int WHERE (col_int = 1 OR col_int = 2) AND col_int = '1';
CREATE TABLE tab_bool
(
    `col_bool` Boolean
)
ENGINE = MergeTree
ORDER BY tuple();
INSERT INTO tab_bool VALUES (true), (false);
SELECT count() FROM tab_bool WHERE col_bool = true AND col_bool = false;
SELECT count() FROM tab_bool WHERE col_bool = true AND col_bool = 'false';
SELECT count() FROM tab_bool WHERE col_bool = 'true' AND col_bool = false;
SELECT count() FROM tab_bool WHERE col_bool = true;
SELECT count() FROM tab_bool WHERE col_bool = 'true';
SELECT count() FROM tab_bool WHERE col_bool = false;
SELECT count() FROM tab_bool WHERE col_bool = 'false';
SELECT count() FROM tab_bool WHERE col_bool = true AND col_bool = 'true';
SELECT count() FROM tab_bool WHERE col_bool = 'true' AND col_bool = true;
SELECT count() FROM tab_bool WHERE col_bool = false AND col_bool = 'false';
SELECT count() FROM tab_bool WHERE col_bool = 'false' AND col_bool = false;
