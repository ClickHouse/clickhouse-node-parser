SELECT * FROM minmax_idx WHERE u64 * i32 = 2 ORDER BY (u64, i32);
SELECT * FROM minmax_idx_r WHERE u64 * i32 = 2 ORDER BY (u64, i32);
SELECT * FROM minmax_idx WHERE u64 * i32 > 1 ORDER BY (u64, i32);
SELECT * FROM minmax_idx_r WHERE u64 * i32 > 1 ORDER BY (u64, i32);
SELECT * FROM minmax_idx2 WHERE u64 * i32 >= 2 ORDER BY (u64, i32);
SELECT * FROM minmax_idx2_r WHERE u64 * i32 >= 2 ORDER BY (u64, i32);
