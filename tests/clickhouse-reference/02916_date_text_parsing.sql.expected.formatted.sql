SELECT *
FROM format(CSV, 'd Date, s String', 'abcdefgh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2bcdefgh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '20cdefgh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '202defgh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020efgh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '20200fgh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '202001gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020010h,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '20200102,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', 'abcd-ef-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2bcd-ef-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '20cd-ef-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '202d-ef-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-ef-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-f-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-f-g,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-0f-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-01-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-01-h,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-1-gh,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-1-h,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-01-02,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-01-2,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-1-2,SomeString');

SELECT *
FROM format(CSV, 'd Date, s String', '2020-1-02,SomeString');