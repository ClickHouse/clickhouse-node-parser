CREATE TABLE fill (date Date, val Int, str String) ENGINE = Memory;
-- *** table without fill to compare ***
SELECT * FROM fill ORDER BY date, val;
-- Some useful cases

SELECT * FROM fill ORDER BY date WITH FILL, val;
SELECT * FROM fill ORDER BY date WITH FILL FROM toDate('2019-05-01') TO toDate('2019-05-31'), val WITH FILL;
SELECT * FROM fill ORDER BY date DESC WITH FILL, val WITH FILL FROM 1 TO 6;
-- Some weird cases

SELECT * FROM fill ORDER BY date DESC WITH FILL TO toDate('2019-05-01') STEP -2, val DESC WITH FILL FROM 10 TO -5 STEP -3;
SELECT * FROM fill ORDER BY date WITH FILL TO toDate('2019-06-23') STEP 3, val WITH FILL FROM -10 STEP 2;
CREATE TABLE fill (a UInt32, b Int32) ENGINE = Memory;
-- *** table without fill to compare ***
SELECT * FROM fill ORDER BY a, b;
SELECT * FROM fill ORDER BY a WITH FILL, b WITH fill;
SELECT * FROM fill ORDER BY a WITH FILL, b WITH fill TO 6 STEP 2;
SELECT * FROM fill ORDER BY a WITH FILL STEP -1; -- { serverError INVALID_WITH_FILL_EXPRESSION }
SELECT * FROM fill ORDER BY a WITH FILL FROM 10 TO 1; -- { serverError INVALID_WITH_FILL_EXPRESSION }
SELECT * FROM fill ORDER BY a DESC WITH FILL FROM 1 TO 10; -- { serverError INVALID_WITH_FILL_EXPRESSION }
SELECT * FROM fill ORDER BY a WITH FILL FROM -10 to 10; -- { serverError INVALID_WITH_FILL_EXPRESSION }
