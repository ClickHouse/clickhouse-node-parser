SELECT *
FROM format(JSONEachRow, '{"x" : "20000101"}');

SELECT *
FROM format(JSONEachRow, '{"x" : "19000101"}');