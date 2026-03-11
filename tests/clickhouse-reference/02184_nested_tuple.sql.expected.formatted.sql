SELECT *
FROM t_nested_tuple
FORMAT JSONEachRow;

SELECT endUserIDs._experience
FROM t_nested_tuple
FORMAT JSONEachRow;

SELECT endUserIDs._experience.aaid
FROM t_nested_tuple
FORMAT JSONEachRow;

SELECT endUserIDs._experience.aaid.id
FROM t_nested_tuple
FORMAT JSONEachRow;

SELECT endUserIDs._experience.aaid.namespace
FROM t_nested_tuple
FORMAT JSONEachRow;

SELECT endUserIDs._experience.aaid.namespace.code
FROM t_nested_tuple
FORMAT JSONEachRow;

SELECT endUserIDs._experience.aaid.primary
FROM t_nested_tuple
FORMAT JSONEachRow;