SELECT *
FROM remote('127.1', `system`.one, dummy)
FORMAT Null;

SELECT *
FROM remote('127.1', `system`.one, identity(dummy))
FORMAT Null;

SELECT *
FROM remote('127.1', view((
        SELECT *
        FROM `system`.one
    )), identity(dummy))
FORMAT Null;

SELECT *
FROM remote('127.{1,2}', view((
        SELECT *
        FROM `system`.one
    )), identity(dummy))
FORMAT Null;

SELECT *
FROM remote('127.1', view((
        SELECT *
        FROM `system`.one
    )), dummy)
FORMAT Null;

SELECT *
FROM remote('127.{1,2}', view((
        SELECT *
        FROM `system`.one
    )), dummy)
FORMAT Null;