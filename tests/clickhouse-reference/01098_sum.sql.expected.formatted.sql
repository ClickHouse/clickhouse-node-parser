SELECT sumKahan(dummy)
FROM remote('127.{2,3}', `system`.one);

SELECT sumWithOverflow(dummy)
FROM remote('127.{2,3}', `system`.one);

SELECT sum(dummy)
FROM remote('127.{2,3}', `system`.one);