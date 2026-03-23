INSERT INTO FUNCTION null() SELECT 1;

INSERT INTO FUNCTION null() SELECT number
FROM numbers(10);

INSERT INTO FUNCTION null() SELECT
    number,
    toString(number)
FROM numbers(10);

INSERT INTO FUNCTION null('auto') SELECT 1;

INSERT INTO FUNCTION null('auto') SELECT number
FROM numbers(10);

INSERT INTO FUNCTION null('auto') SELECT
    number,
    toString(number)
FROM numbers(10);