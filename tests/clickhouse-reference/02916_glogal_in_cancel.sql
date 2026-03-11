SELECT number FROM remote('127.0.0.{3|2}', numbers(1)) WHERE number GLOBAL IN (SELECT number FROM numbers(10000000000.)) format Null;
