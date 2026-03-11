SELECT x
FROM format(JSONEachRow, 'x Date', '{"x":""}');

SELECT x
FROM format(JSONEachRow, 'x Date32', '{"x":""}');

SELECT toTimeZone(x, 'UTC')
FROM format(JSONEachRow, 'x DateTime', '{"x":""}');

SELECT toTimeZone(x, 'UTC')
FROM format(JSONEachRow, 'x DateTime64', '{"x":""}');

SELECT x
FROM format(JSONEachRow, 'x IPv4', '{"x":""}');

SELECT x
FROM format(JSONEachRow, 'x IPv6', '{"x":""}');

SELECT x
FROM format(JSONEachRow, 'x UUID', '{"x":""}');

SELECT COUNTDistinct(col)
FROM table1;

SELECT *
FROM table1
ORDER BY address ASC;

SELECT x
FROM format(JSONEachRow, 'x Nullable(IPv6)', '{"x":""}');

SELECT x
FROM format(JSONEachRow, 'x Array(UUID)', '{"x":["00000000-0000-0000-0000-000000000000","b15f852c-c41a-4fd6-9247-1929c841715e",""]}');

SELECT x
FROM format(JSONEachRow, 'x Array(Nullable(IPv6))', '{"x":["",""]}');

SELECT x
FROM format(JSONEachRow, 'x Tuple(Date, IPv4, String)', '{"x":["", "", "abc"]}');

SELECT x
FROM format(JSONEachRow, 'x Map(String, IPv6)', '{"x":{"abc": ""}}');

SELECT x
FROM format(JSONEachRow, 'x Variant(Date, UUID)', '{"x":""}');

SELECT x
FROM format(JSONEachRow, 'x Array(Array(IPv6))', '{"x":[["2001:db8:3333:4444:CCCC:DDDD:EEEE:FFFF", ""], ["", "2001:db8:3333:4444:5555:6666:7777:8888"]]}');

SELECT x
FROM format(JSONEachRow, 'x Variant(Date, Array(UUID))', '{"x":["", "b15f852c-c41a-4fd6-9247-1929c841715e"]}');

SELECT x
FROM format(JSONEachRow, 'x Tuple(Array(UUID), Tuple(UUID, Map(String, IPv6)))', '{"x":[[""], ["",{"abc":""}]]}');

SELECT x
FROM format(JSONEachRow, 'x Map(Tuple(Date,IPv4), Variant(UUID,IPv6))', '{"x":{["",""]:""}}');