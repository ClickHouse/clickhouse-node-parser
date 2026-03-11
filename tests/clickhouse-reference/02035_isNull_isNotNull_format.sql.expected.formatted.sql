SELECT isNotNull(1) + isNotNull(2)
FROM remote('127.2', `system`.one);