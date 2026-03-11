SELECT *
FROM format(CSV, 'c0 Array(Int)', '""');

SELECT *
FROM format(CSV, 'c0 Variant(String, Array(Int))', '""');