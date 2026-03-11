select * from test where n.null settings optimize_move_to_prewhere=1;
select * from test where n.null settings optimize_move_to_prewhere=0;
select * from test where t.a < 4 settings optimize_move_to_prewhere=1;
select * from test where t.a < 4 settings optimize_move_to_prewhere=0;
select * from test where json.a::Int64 < 4 settings optimize_move_to_prewhere=1;
select * from test where json.a::Int64 < 4 settings optimize_move_to_prewhere=0;
