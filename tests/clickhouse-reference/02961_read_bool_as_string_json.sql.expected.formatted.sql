SELECT *
FROM format(JSONEachRow, 'x String', '{"x" : true}, {"x" : false}, {"x" : "str"}');

SELECT *
FROM format(JSONEachRow, '{"x" : true}, {"x" : false}, {"x" : "str"}');

SELECT *
FROM format(JSONEachRow, 'x String', '{"x" : tru}');

SELECT *
FROM format(JSONEachRow, 'x String', '{"x" : fals}');

SELECT *
FROM format(JSONEachRow, 'x String', '{"x" : atru}');

SELECT *
FROM format(JSONEachRow, 'x Array(String)', '{"x" : [true, false]}, {"x" : [false, true]}, {"x" : ["str1", "str2"]}');

SELECT *
FROM format(JSONEachRow, '{"x" : [true, false]}, {"x" : [false, true]}, {"x" : ["str1", "str2"]}');