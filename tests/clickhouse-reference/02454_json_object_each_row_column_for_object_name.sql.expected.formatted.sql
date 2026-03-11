SELECT
    number,
    concat('name_', toString(number)) AS name
FROM numbers(3)
FORMAT JSONObjectEachRow;

SELECT
    number,
    concat('name_', toString(number)) AS name,
    number + 1 AS x
FROM numbers(3)
FORMAT JSONObjectEachRow;

SELECT
    concat('name_', toString(number)) AS name,
    number
FROM numbers(3)
FORMAT JSONObjectEachRow;

SELECT *
FROM file(`02454_data`.jsonobjecteachrow);