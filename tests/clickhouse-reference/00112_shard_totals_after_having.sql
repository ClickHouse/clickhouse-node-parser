SELECT dummy + 1 AS k, count() FROM remote('127.0.0.{2,3}', system, one) GROUP BY k WITH TOTALS ORDER BY k;
