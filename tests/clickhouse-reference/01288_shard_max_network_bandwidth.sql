SELECT sum(ignore(*)) FROM (SELECT rand64() FROM remote('127.0.0.{2,3}', numbers(20000)));
SELECT max(t) - min(t) >= 1 FROM times;
