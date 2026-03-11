SELECT *
FROM format(JSON, '{"x":{"y":1,"z":2}}, {}');

SELECT *
FROM format(JSONEachRow, '{"x":{"y":1,"z":2}}, {}');