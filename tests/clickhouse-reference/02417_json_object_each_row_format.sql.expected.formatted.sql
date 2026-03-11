SELECT
    number,
    'Hello' AS str,
    range(number) AS arr
FROM numbers(3)
FORMAT JSONObjectEachRow;

SELECT *
FROM file(`02417_data`.jsonObjectEachRow);