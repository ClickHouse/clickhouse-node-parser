SELECT count(*)
FROM tab
WHERE a < '10';

SELECT count(*)
FROM tab
WHERE a < '10.5'; -- { serverError TYPE_MISMATCH }

SELECT count(*)
FROM tab
WHERE a < 10.5;

SELECT count(*)
FROM tab
WHERE a < '9999999999999999999999999';