select * from merge('t_02156_ololo') where k != 0 and notEmpty(v) order by k settings optimize_move_to_prewhere=0;
select * from merge('t_02156_ololo') where k != 0 and notEmpty(v) order by k settings optimize_move_to_prewhere=1;
select * from merge('t_02156_ololo_dist') where k != 0 and notEmpty(v) order by k settings optimize_move_to_prewhere=0;
select * from merge('t_02156_ololo_dist') where k != 0 and notEmpty(v) order by k settings optimize_move_to_prewhere=1;
