/* simple select */
SELECT * FROM minmax_idx1 WHERE i32 = 5 AND i32 + f64 < 12 AND 3 < d AND d < 7 AND (s = 'bac' OR s = 'cba') ORDER BY dt;
SELECT * FROM minmax_idx2 WHERE i32 = 5 AND i32 + f64 < 12 AND 3 < d AND d < 7 AND (s = 'bac' OR s = 'cba') ORDER BY dt;
/* select with hole made by primary key */
SELECT * FROM minmax_idx1 WHERE (u64 < 2 OR u64 > 10) AND e != 'b' ORDER BY dt;
SELECT * FROM minmax_idx2 WHERE (u64 < 2 OR u64 > 10) AND e != 'b' ORDER BY dt;
