SELECT k, uniq(date_dt) FROM remote('127.0.0.{1,2}', currentDatabase(), han_1) GROUP BY k;
