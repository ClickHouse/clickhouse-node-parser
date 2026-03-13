-- this part worked successfully
SELECT *
FROM (
        SELECT udf_type_of_int(1)
        UNION ALL
        SELECT udf_type_of_int(2)
    )
ORDER BY `ALL` ASC;

-- ... and this not!
SELECT udf_type_of_int(number)
FROM numbers(5)
ORDER BY number ASC;

SELECT
    number AS id,
    udf_type_of_int(id)
FROM numbers(5)
ORDER BY number ASC;

SELECT
    number AS id,
    udf_type_of_int(id
    OR id = 1)
FROM numbers(5)
ORDER BY number ASC;