SELECT count()
FROM remote('127.0.0.1,localhos', `system`.one); -- { serverError ALL_CONNECTION_TRIES_FAILED }

SELECT count()
FROM remote('127.0.0.1|localhos', `system`.one);