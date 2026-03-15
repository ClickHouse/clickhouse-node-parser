set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE enum_nested_alter
(d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, e Enum8('Hello' = 1), b UInt8)) 
ENGINE = MergeTree(d, x, 1);
SELECT * FROM enum_nested_alter;
SELECT * FROM enum_nested_alter ORDER BY x;
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
CREATE TABLE enum_nested_alter
(d Date DEFAULT '2000-01-01', x UInt64, n Nested(a String, e Enum8('Hello.world' = 1), b UInt8)) 
ENGINE = MergeTree(d, x, 1);
