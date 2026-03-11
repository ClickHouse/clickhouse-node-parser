SELECT joinGet('kv', 'v', toUInt32(1));
SELECT joinGet('kv_overwrite', 'v', toUInt32(1));
SELECT v FROM (SELECT 1 as k) t1 ANY INNER JOIN t2 USING (k) SETTINGS join_any_take_last_row = 0;
SELECT v FROM (SELECT 1 as k) t1 ANY INNER JOIN t2 USING (k) SETTINGS join_any_take_last_row = 1;
