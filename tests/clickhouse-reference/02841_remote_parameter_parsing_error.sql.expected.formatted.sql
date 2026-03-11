SELECT *
FROM remote('127.0.0.1', sys);

SELECT *
FROM remote('127.0.0.1', `system`);

SELECT *
FROM remote('127.0.0.1', `system`.o);

SELECT *
FROM remote('127.0.0.1', `system`.one, default);

SELECT *
FROM remote('127.0.0.1', `system`.one, default, '');

SELECT *
FROM remote('127.0.0.1', `system`.one, default, key1);

SELECT *
FROM remote('127.0.0.1', `system`.one, 'default', '', key1);

SELECT *
FROM remote('127.0.0.1', `system`.one, default, '', key1);

SELECT *
FROM remote('127.0.0.1', `system`.one, 'default', pwd, key1);

SELECT *
FROM remote('127.0.0.1', `system`.one, 'default', '', key1, key2);

SELECT *
FROM remote('127.0.0.1', `system`, one, 'default', '', key1, key2);