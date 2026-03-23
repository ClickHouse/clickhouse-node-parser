SET check_query_single_value_result = 0;
DROP TABLE IF EXISTS mt_table;
CREATE TABLE mt_table (d Date, key UInt64, data String) ENGINE = MergeTree() PARTITION BY toYYYYMM(d) ORDER BY key;
INSERT INTO mt_table VALUES (toDate('2018-01-01'), 1, 'old');
INSERT INTO mt_table VALUES (toDate('2019-01-02'), 1, 'Hello'), (toDate('2019-01-02'), 2, 'World');
INSERT INTO mt_table VALUES (toDate('2019-01-02'), 3, 'quick'), (toDate('2019-01-02'), 4, 'brown');
INSERT INTO mt_table VALUES (toDate('2019-02-03'), 5, '!'), (toDate('2019-02-03'), 6, '?');
INSERT INTO mt_table VALUES (toDate('2019-02-03'), 7, 'jump'), (toDate('2019-02-03'), 8, 'around');
