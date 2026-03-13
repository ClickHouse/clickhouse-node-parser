SELECT *
FROM view_no_nulls; -- { serverError INCORRECT_QUERY }

SELECT *
FROM view_no_nulls_set;

SELECT *
FROM view_nulls_set;

SELECT *
FROM view_nulls;