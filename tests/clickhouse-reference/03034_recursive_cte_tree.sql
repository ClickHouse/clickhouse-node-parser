SET enable_analyzer = 1;
CREATE TABLE tree
(
    id UInt64,
    link Nullable(UInt64),
    data String
) ENGINE=TinyLog;
INSERT INTO tree VALUES (0, NULL, 'ROOT'), (1, 0, 'Child_1'), (2, 0, 'Child_2'), (3, 1, 'Child_1_1');
SELECT '--';
