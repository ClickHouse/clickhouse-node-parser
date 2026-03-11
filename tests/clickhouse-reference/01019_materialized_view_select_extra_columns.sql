SELECT * FROM mv_extra_columns_dst ORDER by v;
SELECT * FROM mv_extra_columns_view; -- { serverError NOT_FOUND_COLUMN_IN_BLOCK }
