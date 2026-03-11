
-- for pure PREWHERE it is not addressed yet.
SELECT * FROM m PREWHERE a = 'OK';
SELECT * FROM m PREWHERE f = 0; -- { serverError ILLEGAL_PREWHERE }
SELECT * FROM m WHERE f = 0 SETTINGS optimize_move_to_prewhere=0;
SELECT * FROM m WHERE f = 0 SETTINGS optimize_move_to_prewhere=1;
