-- Index works without mutation applied.
SELECT * FROM t WHERE value11 = '000' SETTINGS max_rows_to_read = 0;
-- Index works with mutation applied.
SELECT * FROM t WHERE value12 = '000' SETTINGS max_rows_to_read = 0;
