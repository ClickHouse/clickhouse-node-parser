SELECT *
FROM remote('127.0.0.{2,3}', `system`.numbers)
WHERE number < 10
FORMAT Null;