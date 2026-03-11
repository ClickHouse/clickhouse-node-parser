SELECT * APPLY(toJSONString)
FROM t;

SELECT toJSONString(map('1234', '5678'));