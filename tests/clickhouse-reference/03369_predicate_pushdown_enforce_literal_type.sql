SELECT d, count() FROM remote('127.0.0.{1..10}', currentDatabase(), t_03369) WHERE event != '' GROUP BY d HAVING d >= toDate(1738281600) AND count() >= 1;
