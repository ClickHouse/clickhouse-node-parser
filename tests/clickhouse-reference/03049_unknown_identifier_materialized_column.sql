select * from l L left join r R on  L.y = R.y  where R.ty >= 2019;
select * from l left join r  on  l.y = r.y  where r.ty >= 2019;
select * from {CLICKHOUSE_DATABASE:Identifier}.l left join {CLICKHOUSE_DATABASE:Identifier}.r  on  l.y = r.y  where r.ty >= 2019;
