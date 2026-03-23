DROP TABLE IF EXISTS enum_nested_alter;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE enum_nested_alter
(d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, e Enum8('Hello' = 1), b UInt8)) 
ENGINE = MergeTree(d, x, 1);
INSERT INTO enum_nested_alter (x, n.e) VALUES (1, ['Hello']);
SELECT * FROM enum_nested_alter;
INSERT INTO enum_nested_alter (x, n.e) VALUES (2, ['World']);
SELECT * FROM enum_nested_alter ORDER BY x;
DROP TABLE enum_nested_alter;
CREATE TABLE enum_nested_alter
(
    d Date DEFAULT '2000-01-01', 
    x UInt64, 
    tasks Nested(
        errcategory Enum8(
            'undefined' = 0, 'system' = 1, 'generic' = 2, 'asio.netdb' = 3, 'asio.misc' = 4, 
            'asio.addrinfo' = 5, 'rtb.client' = 6, 'rtb.logic' = 7, 'http.status' = 8), 
        status Enum16('hello' = 1, 'world' = 2)))
ENGINE = MergeTree(d, x, 1);
INSERT INTO enum_nested_alter (x, tasks.errcategory, tasks.status) VALUES (1, ['system', 'rtb.client'], ['hello', 'world']);
INSERT INTO enum_nested_alter (x, tasks.errcategory, tasks.status) VALUES (2, ['http.status', 'http.code'], ['hello', 'goodbye']);
CREATE TABLE enum_nested_alter
(d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, e Enum8('Hello.world' = 1), b UInt8)) 
ENGINE = MergeTree(d, x, 1);
INSERT INTO enum_nested_alter (x, n.e) VALUES (1, ['Hello.world']);
