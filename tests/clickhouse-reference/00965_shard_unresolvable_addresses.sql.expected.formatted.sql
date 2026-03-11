SELECT count()
FROM remote('127.0.0.1,localhos', `system`.one);

SELECT count()
FROM remote('127.0.0.1|localhos', `system`.one);