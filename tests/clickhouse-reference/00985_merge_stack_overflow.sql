CREATE TABLE IF NOT EXISTS merge1 (x UInt64) ENGINE = Merge(currentDatabase(), '^merge\\d$');
CREATE TABLE IF NOT EXISTS merge2 (x UInt64) ENGINE = Merge(currentDatabase(), '^merge\\d$');
SELECT * FROM merge1; -- { serverError TOO_DEEP_RECURSION }
SELECT * FROM merge2; -- { serverError TOO_DEEP_RECURSION }
