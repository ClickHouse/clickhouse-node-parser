SELECT *
FROM remote('[::1]', `system`.one)
FORMAT Null;

SELECT *
FROM remote('[::1]:9000', `system`.one)
FORMAT Null;

SELECT *
FROM remote('[::1', `system`.one)
FORMAT Null;

SELECT *
FROM remote('::1]', `system`.one)
FORMAT Null;

SELECT *
FROM remote('::1', `system`.one)
FORMAT Null;

SELECT *
FROM remote('[::1][::1]', `system`.one)
FORMAT Null;

SELECT *
FROM remote('[::1][::1', `system`.one)
FORMAT Null;

SELECT *
FROM remote('[::1]::1]', `system`.one)
FORMAT Null;

SELECT *
FROM remote('[::1]')
FORMAT Null;

SELECT *
FROM remote('[::1]:9000')
FORMAT Null;

SELECT *
FROM remote('[::1')
FORMAT Null;

SELECT *
FROM remote('::1]')
FORMAT Null;

SELECT *
FROM remote('::1')
FORMAT Null;

SELECT *
FROM remote('[::1][::1]')
FORMAT Null;

SELECT *
FROM remote('[::1][::1')
FORMAT Null;

SELECT *
FROM remote('[::1]::1]')
FORMAT Null;