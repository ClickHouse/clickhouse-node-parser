select count() from t where a = '0' and b = '0' and (c, d) in ('0', '5');
select count() from t where a = '0' and b = '0' and (c, d) in ('0', '5') settings optimize_use_implicit_projections=0;
select count() from t where a = '0' and b = '0' and (c, d) in ('0', '2');
select count() from t where a = '0' and b = '0' and (c, d) in ('0', '2') settings optimize_use_implicit_projections=0;
