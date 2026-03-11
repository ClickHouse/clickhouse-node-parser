
SELECT * FROM m PREWHERE a = 'OK' ORDER BY a;
SELECT * FROM m PREWHERE f = 1 ORDER BY a; -- { serverError ILLEGAL_PREWHERE }
SELECT * FROM m WHERE a = 'OK' SETTINGS optimize_move_to_prewhere=0;
SELECT * FROM m WHERE a = 'OK' SETTINGS optimize_move_to_prewhere=1;
