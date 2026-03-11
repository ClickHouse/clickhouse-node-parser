SELECT * FROM merge1; -- { serverError TOO_DEEP_RECURSION }
SELECT * FROM merge2; -- { serverError TOO_DEEP_RECURSION }
