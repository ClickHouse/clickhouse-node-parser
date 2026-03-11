SELECT
    dateTrunc('second', '2020-10-10 10:10:10.10'::DateTime64(2)) AS result,
    toTypeName(result);

SELECT
    dateTrunc('month', '2020-10-10'::Date32) AS result,
    toTypeName(result);